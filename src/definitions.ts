export interface OfflineDBPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
