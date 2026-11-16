Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F369606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c6Xieozr;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EozrHrFH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bpsDtS6OuBpkH9ZEgUQdyxcyAEWyH5FS+fjhLD8UhvI=; b=c6XieozrvEBtxv+xAXe8lx+6vq
	o3D+vWcogRdChsalURx05VpFMj9MGOVG6bExeq6Ubyv1HrFYoMJBrSCBcS/ADxyWz7zuRfNfTbWHP
	M/BnVWMJ+b1lFwdgjkdEFtQxhW3SDPcxIQePIs8iIm47cBVMt4ECEULTXSC6J/8LkbyIiOj/sJwAr
	6uhJcVO4UmzthMQaxMAD+dvsrFcfxgGdTTeZ4aHNpozOKfosfwcUFWt9dKLoIZqmE2Vs4HfjqtaHc
	TjlOhW7gsmAOitqsziRJ2ETZBhcBax4ve3po3VztzZZCuKZBSvluo0n708KdmgfCD1b+b1lJsVEUK
	3WzCcugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT35J-00000003ql7-0xDh;
	Mon, 16 Nov 2026 20:13:49 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT35G-00000003qkg-2Hsm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUoTReCIt1S60gqhY6fEYj4Tph6oDlGuiSe7ONjM0/D7ut0cp+9OdGiSz8nIo6T/psgD/BywraHrPtPEW40cMXDE3rXa3rolBr/MW/WUSvLMaCNU3s6RMZFjyivf7TTp9Our4lRsWc9dQcJFo6Vkx52xouOCHkf/y8BobvV5cR+NU71YqttJ/ErRezTS90eWCyNXcy7cVH69KFAtBtcjuofujH6dmLlHSCEkp3ecuerwHa7I+9GvOzioB96HLxruE4Ve/FhfMqWvP1gA+o/2MT3MX6+oUssQC0hYEQaEgDkL7JGp8Yrzb/5+K2TMlUIxj+wY+jszvlmR3kNs5L65aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpsDtS6OuBpkH9ZEgUQdyxcyAEWyH5FS+fjhLD8UhvI=;
 b=FX99KVR753nHgtaBVsNMhIlQE0QqX9W3jA0KGghwFvj1x5arovlXfrd9eU6lIydDoo0cCUY4aVEEBVJkTLvvaLHANQ5UvH/WC2FHvHrKLe+BVboMp8gcFoJ6vJnseJ2Q4gukldBFrRLwMEtHq6z9c16nQdBg21S2lWPP8ZRuwbKOhPVgbvVNBwzs4JvTQlTXQ0adosR8403cebmlCb1LOT1yh5KzoQ76ANT1rdb+0vgsQT+9AWEAsLvOClbswm+ZJx3KnMZ1jzAry6JxDVRMDxCY2WVq6nYkvRIbVewySBrxo0OazwsSWvdbfueG3GTay8znBugE/U4jhyg0/bVlgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpsDtS6OuBpkH9ZEgUQdyxcyAEWyH5FS+fjhLD8UhvI=;
 b=EozrHrFHQjFAoqVsA150mafkp0kI1uU0RqwDo/N9j6gKTwui+KStVOz2A9BByiif58zeFKXC2e4jVbSteTJvrwSe6xatXbFiMkHwEPMhxjC7XjhWLlf8c/Jb8vX2BtfuIdD/hEwHAqgN89dWHystM0H7IrH/mEfLDQN+Ew0b0yw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA4PR12MB429550.namprd12.prod.outlook.com (2603:10b6:207:128::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:10:34 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:10:34 +0000
Message-ID: <75c12dd8-f78b-49ee-8853-bb00e29f6919@amd.com>
Date: Mon, 16 Nov 2026 14:10:29 -0600
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 17/19] fs/resctrl: Control visibility of global per-CPU
 kernel mode group files
To: tony.luck@intel.com, reinette.chatre@intel.com, ben.horgan@arm.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 x86@kernel.org, fustini@kernel.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 jlayton@kernel.org, seanjc@google.com, ewanhai-oc@zhaoxin.com,
 binbin.wu@linux.intel.com, nikunj@amd.com, ashish.kalra@amd.com,
 peterz@infradead.org, superm1@kernel.org, thomas.lendacky@amd.com,
 prathyushi.nangia@amd.com, kim.phillips@amd.com,
 ricardo.neri-calderon@linux.intel.com, darwi@linutronix.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1794437052.git.babu.moger@amd.com>
 <6af7466df1a5e64bc2804ba3d8c7e2e592793cae.1794437052.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <6af7466df1a5e64bc2804ba3d8c7e2e592793cae.1794437052.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0067.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA4PR12MB429550:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc609f4-ddc4-4502-8369-08df441dabf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|260925021311599003|56012099006|260925022911599003|5023799004|4143699003|11063799006|260925021911599003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NdgeHYShOF/gl7cGQQeZJyeB2nIugwUHHfcYY7qSfT1/PBU83BqXpcQoJlF3QjlcfEZO9blx7tc/bvE/0iG7Ti/wxlhxuNAOMOAsr9OrbrUvaWwRdJi7VGHp2cHNBhJk8HT6l+jdVTBasvwfZsRXGmU47HaG2xDN3nhtBbhy1rq8Fv1zI+z9iqzrmvu9kx9uIjYuZzKZyhbHuOJqU/zZqOt+/rN9lLObqftM9iiiKJ/i+6J0Vw65+i9ZrcHHua53uk38VtBBgVu5QwRi14E+V59k+wTVbgAXmn1zt/M8JRskowrNzCgOcjcEscxmH1QXqZnQ7DPFLEDrWCE7t72R+nLEt9eJD2rDvBOtbZkdvvp6TZFXfwH1LzQ30sQCRCsgkEj571tSMUnnic7s/wrcKZBlYPRbaiSNeK1wAD6xyneiRM9sl3/wOPwdZW9tD2NUPALUZXypj9Ha+P3gjDYsaxRJR+WiSCsg8rhXWEHuV/I3AddliMSkwaJQ90ARJDOIqLfK/i6Xqz8ByNLJWpijY6eOaGzHg2MNV8XChqMbnzODo9YZ1LQWhZ8ykjVGf8L9oH/RHZaN0nYY/56jNLuWHuwQ+v3QXlfQU6kw5sKl0Vs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(260925021311599003)(56012099006)(260925022911599003)(5023799004)(4143699003)(11063799006)(260925021911599003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmQ2MU9PQXBBeHY0dFUxODRINzRYWDZDSXBzREtHM2pmeVlETVJzZHpJS2I5?=
 =?utf-8?B?Y0JqTXA2ZHV3SnJpbjhRcVYzVExMYW1XeHZKUTBsNko0WnhvOEV1azk1UEl1?=
 =?utf-8?B?cFlDMGhnQlNENlVMYWlZWTRFcjRqcUdlZUltU1c3eHFNd0UvaWhHLzZyZlpP?=
 =?utf-8?B?SWxla2E5ZHNvWHQzNFM2b2REbWV3dU5pMTdkMGM0RXoxeWo2RUhjb3FKSDNz?=
 =?utf-8?B?QTlDZDNDSis2ZE0rdnF1djlnWkw5NTduN2pWTDQxYkpmWVI1THg2a1o2ZURy?=
 =?utf-8?B?azVPMW9qaEYxOGt4WWNuSWQ5UFZ1em96VktBSWFEb29XaElxRjBoVlU4WlQ2?=
 =?utf-8?B?c2dWS1dBQ0tNbVVjR3QwK0htWWxRaHZhbFlmdnVMYlNRVzMzaWZtNU9WK2lS?=
 =?utf-8?B?T1A5SENUZGsxOUJZdXVNYm5DL0NydWdESEFJMEF1UlE1cVMyaGhOdGJadW5Q?=
 =?utf-8?B?QmlxRjFtTTN0MmwxdUczVENZODZLVzNiclBEK2pTRWpQYUt1NWhjYUhVL3lh?=
 =?utf-8?B?czhuaEt0N2ozVHZNTHYrTnpvL1B1cnFjV0ZGMnpnbUZOYUFwMTVLVmRlUmI0?=
 =?utf-8?B?WHYvTTAzd3U5RWcxamZtLzNtUm5KUUJVeXZvVEpmN1FZZkRzaC9hNWlMNXVC?=
 =?utf-8?B?SDgyQlp6VFZ4dS9uT1JYRzIrL09yaURBdUt1M0E2SDFVczJjWmNpZWhSeTMy?=
 =?utf-8?B?L2ozS0tNK1A4dWhtS1krOU0vRVJaRzBJNmFyQXd3aFpYMEhKNlJ4cWVKaE5t?=
 =?utf-8?B?TmIyZWNiNEt0NjJUczlBLzdIK0R1eHlCckJmSXBmbkpXbkg2VnNKcHA4eWlG?=
 =?utf-8?B?WHlCZFhSWGxpMkpxUDZzRmNnZk5SYklJN1h2VWVQZ2JVeHFjUE5KeldSY1RM?=
 =?utf-8?B?QzFyYmxqY1dVT2lsajgvU3pwVDNRTHZHSG55MVVLbVFFUmFsemdYbTV3Yy9j?=
 =?utf-8?B?eE14UTRFaDlvYnhXL1ordkNxVTNwdXMvOENnYlNZK3FMem5TRkpzWW1abEhH?=
 =?utf-8?B?OHZoWHdLcW1DSWRRSG1aeFAxOGE5S2Y5K3VpSXFBVEVSbEZzTHpaVFZoSTU5?=
 =?utf-8?B?czFNeGlvcDErL1dmM3Fkei9Vem5NSVlXTGs2b2ZkYzNOcVdNd1l0NW0zdkVw?=
 =?utf-8?B?Z1V0bnFhay9OMHhvVU9HWXhxRndZN1N2MGxib0NYai9jRk1TSmkrcFZFYnBY?=
 =?utf-8?B?Rmp2N2VUbmd0b0ZqVFlXTzJRMWJ6K3FqdTllN3BTVEYxcDJCSVhmaERMcFV1?=
 =?utf-8?B?NExhdk51TGFWczlPNmlJQm16YzVocDdkcXB2RU1DcHFRUElMSy8zOHlsS0lm?=
 =?utf-8?B?QkYzZFZsTUN3RktaRERoc1JZaEN1SzhXSnc0N0l6b21adkJqU0gvcVV6Tjgy?=
 =?utf-8?B?RElXaUtMY0ovRFYweldQbTVFRk1EV2xqL0dBZ2hsQkJpV0ljYmh0VVBGVXRZ?=
 =?utf-8?B?WE9kcjIvcmxWdWtOd3dGYndUWlpOZVRSUTBJN3VIanhyMEQrMEhhZzBCdzhw?=
 =?utf-8?B?SG82eXl4cFc5NjVpelh3czhJU04yZEtRRkJUdE1jM1pMTG13bWVTaVFnanhM?=
 =?utf-8?B?WGQ2WnNxQ3RZMWxYbTgvTUVxMzJGS0NhdzlXRFdVUk9WNm9sREV5TlZyVlY1?=
 =?utf-8?B?TlhnZnorKzZzWDBTUEJtSmU1dE94U0V2clhISVpwV2JvY0RsaXZYVGlscGhP?=
 =?utf-8?B?aENOYnpkVFE1b2k0bFNLamx0S0pqSzhNQUZTeWJ4a2N6dWRKRTdpYlI5azJO?=
 =?utf-8?B?dnhicGZlVjEzOTkySWtIL1A2RW9YaERVaGpyOGp6OVMzelQ5MXpJa0RURjRo?=
 =?utf-8?B?dDZRMkpsK0xBeU1kc0ZKR0FKdFhUTnFYeVZwMHNESlNWZnJ4bGdhNkdieEZC?=
 =?utf-8?B?QThSTVl0S081L1huakFjb1RCdm5ZNklvUzVveEoyZC83amhHTFUxR2Q1a3I4?=
 =?utf-8?B?K3g0NnUwdFRYMTE1dXJrZCtRS0hnaGpEcnY2MGVHMlJ1ZHBWL1hadTh1S3d5?=
 =?utf-8?B?ZlZnWXl6VlV4TklLeGZoSmk2WlZ5SGRxcEUxbStMUFk3Y1RtbHpDRVk2N2o3?=
 =?utf-8?B?QVNmblZMUFloeDVVZjl6TStsL2dxVDJ6SkdCQmM2eXl6RFN2dHBHaGpLK1Ja?=
 =?utf-8?B?UVdROHlMdDJJYUozbEJLb3laMzFsa0FRdkVxWG5YYTROZTEvQnVsSjFxcU1G?=
 =?utf-8?B?ZU5rdUFkMEw1R2RqQTVNQlVYT0R5YVVlVnJTWHE3SkN5MGV2SkRWdFJ1bzJy?=
 =?utf-8?B?WVFIMjNTZ1h1ZkRKUFdXRDN3SEFMY2svNk5BSHhRUFYzNkxFd0Z0SVlUc2oz?=
 =?utf-8?Q?CJwuqGvQwWUDj0doj7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc609f4-ddc4-4502-8369-08df441dabf9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:10:34.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmHDOeHGXaxwDwM3Gj/Xy2xOq9tZ5DZNkXx4FQYNtb0bbEGCBVEaA7WfT/6jBE/1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB429550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_121346_681067_79D4B1A7 
X-CRM114-Status: GOOD (  25.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 16:44, Babu Moger wrote:
> The kmode_cpus and kmode_cpus_list files are specific to the global per-CPU
> kernel mode. These files are created in a hidden state when an rdtgroup is
> created.
> 
> Introduce resctrl_kmode_global_files_show() to control the visibility of
> these files for individual resource groups. Show the files only for the
> group backing the active global per-CPU kernel mode and hide them for all
> other groups.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v7: Updated the prototype rdtgroup_kmode_global_files_show().
>      Moved the patch after both rdtgroup_kmode_global_activate() and
>      rdtgroup_kmode_global_deactivate() is Introduced, so the change is
>      symmetrical.
>      Updated the changelog.
> 
> v6: Helper named for the global per-CPU files instead of unhiding every
>      hidden file on the group.
>      https://lore.kernel.org/lkml/34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com/
> ---
>   fs/resctrl/rdtgroup.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 1ad169e714a4..86bd6a66812b 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1136,6 +1136,24 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>   	return 0;
>   }
>   
> +/* Show or hide kmode_cpus and kmode_cpus_list on @kn. */
> +static void resctrl_kmode_global_files_show(struct rdtgroup *rdtgrp, bool show)
> +{
> +	struct kernfs_node *kn_file;
> +
> +	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus");
> +	if (kn_file) {
> +		kernfs_show(kn_file, show);
> +		kernfs_put(kn_file);
> +	}
> +
> +	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus_list");
> +	if (kn_file) {
> +		kernfs_show(kn_file, show);
> +		kernfs_put(kn_file);
> +	}
> +}
> +
>   /*
>    * resctrl_kmode_global_online_cpu() - Program kernel mode association for @cpu
>    * @cpu: CPU that has just been brought online
> @@ -1194,6 +1212,7 @@ static void rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
>   
>   	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, false);
>   	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	resctrl_kmode_global_files_show(rdtgrp, false);
>   
>   	resctrl_kmode.rdtgrp = NULL;
>   	resctrl_kmode.active = RESCTRL_INHERIT_USER;
> @@ -1214,6 +1233,7 @@ static void rdtgroup_kmode_global_activate(struct rdtgroup *rdtgrp,
>   
>   	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
>   	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, true);
> +	resctrl_kmode_global_files_show(rdtgrp, true);
>   }
>   
>   static int resctrl_kmode_parse_state(char *val, enum kmode_state *state)


Sashiko reported:

https://sashiko.dev/#/patchset/cover.1794437052.git.babu.moger%40amd.com?part=17

=============================================================================

commit 05ab3c952d1bee6b5476ced04f03000037d907a0
Author: Babu Moger <babu.moger@amd.com>

fs/resctrl: Control visibility of global per-CPU kernel mode group files

This commit introduces a helper to show or hide the kmode_cpus and
kmode_cpus_list kernfs files when a resource group activates or deactivates
global per-CPU kernel mode.

> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 68e72afada85a..e2a996102f7e1 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1136,6 +1136,24 @@ static int resctrl_kernel_mode_show(struct 
kernfs_open_file *of,
>  	return 0;
>  }
>
> +/* Show or hide kmode_cpus and kmode_cpus_list on @kn. */
> +static void resctrl_kmode_global_files_show(struct rdtgroup *rdtgrp, 
bool show)
> +{
> +	struct kernfs_node *kn_file;
> +
> +	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus");
> +	if (kn_file) {
> +		kernfs_show(kn_file, show);
> +		kernfs_put(kn_file);
> +	}
> +
> +	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus_list");
> +	if (kn_file) {
> +		kernfs_show(kn_file, show);
> +		kernfs_put(kn_file);
> +	}
> +}
> +
>  /*
>   * resctrl_kmode_global_online_cpu() - Program kernel mode 
association for @cpu
>   * @cpu: CPU that has just been brought online
> @@ -1194,6 +1212,7 @@ static void 
rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
>
>  	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, false);
>  	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	resctrl_kmode_global_files_show(rdtgrp, false);
>
>  	resctrl_kmode.rdtgrp = NULL;
>  	resctrl_kmode.active = RESCTRL_INHERIT_USER;
> @@ -1214,6 +1233,7 @@ static void 
rdtgroup_kmode_global_activate(struct rdtgroup *rdtgrp,
>
>  	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
>  	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, true);
> +	resctrl_kmode_global_files_show(rdtgrp, true);
>  }
>
>  static int resctrl_kmode_parse_state(char *val, enum kmode_state *state)

As reported by Reinette Chatre on v6 [1], should
resctrl_kmode_global_files_show() be renamed to
rdtgroup_kmode_global_files_show() to match its struct rdtgroup 
parameter, rdtgroup_kmode_global_activate(), and 
rdtgroup_kmode_global_deactivate() (as noted in the v7 patch changelog)? 
  The comment above the helper also still refers to @kn instead of @rdtgrp.

In addition, the commit message still omits the requested context 
explaining why kmode_cpus and kmode_cpus_list are specific to global 
per-CPU kernel mode (used by user space for per-CPU enable and disable 
of the mode) and why they are created hidden (a resource group can only 
be assigned to global per-CPU kernel mode after creation via a separate 
resctrl file).

[1] https://lore.kernel.org/r/c600a240-ed11-4e31-b3c3-779f01175f28@intel.com

=========================================================================

My bad. Yes. Will fix the naming to rdtgroup_kmode_global_files_show() 
and also will fix the comment about @kn

Thanks
Babu


