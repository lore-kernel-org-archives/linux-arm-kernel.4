Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C11606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+DuKtMV;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tdKVU2Zi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HiOw3LdF1JN3zT4AciHve3DOdwEMwZOqZoL2IhKD2i0=; b=w+DuKtMVUgZGdgIcdfxtiNGxai
	ogRw09nP1yEk1NltOuU7rBKOXBp3TEgeKldfz7TxDSDn1oXcz0G0tOCY++hsM6DnXiWkTO/Lm9MGG
	xUkvljghmKBJYfLQq4Hqiwy6nb3I5A5Ds5FODUm0eksx9JEqeC/h49QlPmaDFYyZU3vBiaG4vkX0r
	Q9JLlsIaiTtgr1Y2CI+u2uXgNyKtk6JEv92apE8RIe1AIP8eCcVHhZk/3gHS9mEcEUE7xwTmka7il
	6sgc9867IBb63J6ELSPA1pop11ltXQScrLnDHRtda8Sc6nbsbrSRkYUVUG0Zjj1frxQ+G5fxL8Dym
	Be8RyypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCd6-00000007MPi-1cCI;
	Wed, 11 Nov 2026 18:01:04 +0000
Received: from mail-westus3azolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d116::] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCd4-00000007MOB-0Z0i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ0atUfiF1grk2yeslh41nlYMGDUt92V+sagUKv4/nFrHsWC2F8rZl3jC/EgrPCSXXFj87kR3SEpEX6fF4xeX26QrCnl86/4kRID9RFaw4Iw/UmKMDUFWFUo/5vPnlLAx8JJPe8tH4oTxuXUYcHrCsqh0OEbK8Sn9SznZdON276p77krevuI3PCyKBTaA3thRtiXnGSXvD738Xx+Q+0R4lL/scT174r3UhXm3zaMyPTFOi7W/rHV9cs3d0XAB6TPtWyJ7VTOIhbdWWLKWL+WWbiPefOxMejhT0A2iqEQIpYOe62dEmCABR75rm0fUSoBu2nr2FKIcV7WVpDJoeRhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiOw3LdF1JN3zT4AciHve3DOdwEMwZOqZoL2IhKD2i0=;
 b=YrOXnioxflaZUhFCDkBIHtY3hsd3PL1+wFcktTt0ucuDVyoAgeMrWbKXPlQphXZtvx0deTyioVCh0FjJ7MMXT2uodWCNc++jkCY298k/MN/zGbN/nw5nc6h9reOx9pObst2ITXDyVIqCIelTrg+FMvepHworfc3frN4ItlCJXyjn/8Sv+JIxXBWGFIr06hc4zI/BOjFx1YrQqjUfuiQxN/IMWVqZweq7kpHDzZILBMJJ8bo/aUdSaPspyxKYT2ixa9afySLta6TzcnrAawb5oyWuAcg8eG3OkIkXBKo9fTaDcoXcX+3jm0zMTg2bAYW3iYaVjuvq9LZzAcsOoSfxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiOw3LdF1JN3zT4AciHve3DOdwEMwZOqZoL2IhKD2i0=;
 b=tdKVU2ZiCKGd03AYAgEtusE2hu94djj+HZdwGYhHsXCfz7SYT4wiTBZVBnztpmu5fqY781tFXQVOqolxnG0L4WoTdJU5NohPJ7Uy2j9s2EAHOqVocbEQ+j8CHaZDiLJ/0/FiS3HPOXnOUICV6sExmfb3N+BBW+IscNBzcdEh67ELV8P3UVM64IOETrwPE3tGBoXRUDmhKsizurtbtcTeqIbi7CwIV3DEF6FSoPrnQxnvAmK2O6fZKcKmDThXLUehbBWLuCB71rBN6bRGWwH06pQCf2VXiHOEMVtobpEY+kwYgD9VsvY772gKaETJsxUJn30ZD5E3tiiIG8rUP3jjWg==
Received: from MN2PR02MB6863.namprd02.prod.outlook.com (2603:10b6:208:1d7::20)
 by CH3PR02MB9714.namprd02.prod.outlook.com (2603:10b6:610:173::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 18:00:59 +0000
Received: from MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53]) by MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:00:59 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>, "decui@microsoft.com"
	<decui@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "will@kernel.org" <will@kernel.org>
Subject: RE: [PATCH v6 3/6] arm64: hyperv: Add per-CPU RSI host call
 infrastructure for CCA Realms
Thread-Topic: [PATCH v6 3/6] arm64: hyperv: Add per-CPU RSI host call
 infrastructure for CCA Realms
Thread-Index: AQHdaMzTk5/lTQAdtkW0DiK1+GVhibcpO5kQ
Date: Wed, 11 Nov 2026 18:00:58 +0000
Message-ID: <MN2PR02MB686375CB482F6EEA9D00F806D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-4-kameroncarr@linux.microsoft.com>
In-Reply-To: <20261031001412.4150488-4-kameroncarr@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB6863:EE_|CH3PR02MB9714:EE_
x-ms-office365-filtering-correlation-id: 9597c95f-c796-4c21-dcd8-08df401dbdaa
x-microsoft-antispam: BCL:0;ARA:14566002|13091999003|24021099003|31061999003|25010399006|55001999006|41001999006|19110799012|8060799015|12121999013|8062599012|37011999003|51005399006|15080799012|12091999003|40105399003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?TBJU6N0Hg/UtsYVB+8Y+f0zzzQxnLkYrmoOMXLHnVllBaHyaRQsFRbM+7+Rx?=
 =?us-ascii?Q?i7zBT8TAEGAWsJbYCWsAbcbYKxw/2GfP95QHEnd+0eiWOZww9QIupz0NOwfS?=
 =?us-ascii?Q?TPjrOR/uLA/Ou7NSXoMURgUVRVWIyYZYBGwvcAYEuK+7bI7ccFV9NPuM7oZd?=
 =?us-ascii?Q?LYEMrTLFRyOkcPjCVok8SbHqAk/Ru08RpnwQv6dIobv/J8Daqt1EOocuCHdL?=
 =?us-ascii?Q?ImJjnLAS8weZt2/Zl6JIsD5fJOb1i/Q62pDu6g6xW7UH5WNtyK/wKg9zreAw?=
 =?us-ascii?Q?JMKyP+hj0wF1x7RMAoUk997reaRbGTJn9MvaRon73EDXn+S59yloZN6tak2W?=
 =?us-ascii?Q?sZ2MWBM46mjYZUC7/c9/CUconVoOx7+3kyc6aPMlajaZX1pqMi/o5MdDjnxh?=
 =?us-ascii?Q?MEPqMgB9lDCSK44xUr5fKPN8Eu1y27KFFXCkERayjTTj+1fNq0WX3meG9KNh?=
 =?us-ascii?Q?ZTl6xbbFCLG1fyh4FT6hSpxapxChaNETnoHlx61IY7bRFdIg5Eaju9GWkY5B?=
 =?us-ascii?Q?dGdXlSWwAlQK0jzXfSVK5rKidl5IcVTtlGVUYlinUBhV1gzTwh/Z//hET4Ve?=
 =?us-ascii?Q?RaJf6uJq5B2EjTK4XhDkZpWDko0ewIH06SgaVcG0YZ+MBzTmTUlP8k9gbXzF?=
 =?us-ascii?Q?F7KKzQfOv57PpRxCQgCAmMU8wCe8vB8wirUS52Wcd1/f8YTiBV+M8gJFlZMY?=
 =?us-ascii?Q?I/c69tWFS5mPCM4qWs6PzQTyhpWbEtMzuLH79PqqgnJwsmdk7gNexyJhkdEI?=
 =?us-ascii?Q?dP8zAFtonFKPadMP+2biW7d6wePa8zRE2kyv9sAbfBNQEW/oIvMi1AzG7yT+?=
 =?us-ascii?Q?2DysMVSJcnfF9Gz97bXyMelPVOoZ7cF2f+9v2KJSB7Cu93Cxs6jNydJS2Quk?=
 =?us-ascii?Q?OfChn2d4bKnKMSUGyfnS6biG/q1n+gQ3Qxz83++3f8FfcX9aJDF6r6LpJ+NP?=
 =?us-ascii?Q?Tqfz5MszkqVCQcLDfGUVLgzfXRGltqCWhEhgMfy5bkkfAs8nsZgG/bOMVDjj?=
 =?us-ascii?Q?+rYio3Xqgucgjrg3KKQ5yRS8snpIui/yD7yfcVmCMTmfZME9/ldjl2Lf8/+Y?=
 =?us-ascii?Q?aTPKosV/XpBeQJCi+EjMaPuz0Zb5Sf3aJxLJw4D0xU70scPG+DjRgOobWL/o?=
 =?us-ascii?Q?y1bvEjy6Y00A?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8613EuhF0qBEIG32khtXATXyUwe7UVRnltGSzM1RaEBkn08ElKXU+6R2baeb?=
 =?us-ascii?Q?uJ5L3QLnykf4QWnOago0TSo4kJXdwU2/wDOn42LmHv9h9ae6h0I702sp67PV?=
 =?us-ascii?Q?T4wuMeCo+WeiYx5bVMdiSIQNRKuzxfuPv0UfzT+wLzKXEAW+BCTAOhaWSp7c?=
 =?us-ascii?Q?F33GMm6jvl/aNRobJat4f4kpclkQNgHr/uGxciDl51No3DiDpW4G5iPaommu?=
 =?us-ascii?Q?4wPswZVEXquCPvbQ8Wz4FY2/VutBLvujl2LsVbJMXT5lkbUk6/2V413Rh3aH?=
 =?us-ascii?Q?M/7b8kDKlmtRn1DMbMaAmXG3ZZI16ITL2ycAljBATu1nN3X4IIS8PA1wjT02?=
 =?us-ascii?Q?p+E426vQeyiknczmFHKNXNqOISk79OKhgb85HuhH5+9xqD5Gd+SHudduO457?=
 =?us-ascii?Q?kpDl7TLGk5pYVGg5eXRRaw5r4F0EdwqvNm35/Bqt68v0iK20U+BbJaqNDD0G?=
 =?us-ascii?Q?3ojGd5qh1cKLxs+6UuzPFC0de0eNDrnIDMQfqnSP6u9XiX12xtecSP9x7mcf?=
 =?us-ascii?Q?T6sl2FyVexZTPUm4ec9vQbvRNLvv5iKQ+LJJ6Yld3/e3VdcNs21ZC84Ey2FH?=
 =?us-ascii?Q?By152Mp3nF0aj2PN+eH9kabwMrCnlPGs0njEhuKMhitKzHszS15NSb1xLac6?=
 =?us-ascii?Q?aHr1/I3ZmmUpzjGBBtnPpaku6yD8PLtqYozhhmtIAhsausnLIrg7Wynsvh4y?=
 =?us-ascii?Q?wGAU83RFN8eOqETGq0+UhmOqrizocXErMxzTe+XLye53I5YLZT+pQb/GXeHd?=
 =?us-ascii?Q?c0vSVrTqU2ptDe4crQFr2VW5mz99WTAIIOHz/HuSLkrVRM9u/eu59U1fKPTn?=
 =?us-ascii?Q?NgL73rNHzKdrY19t79EWNuoYFekIZZ61ogekH9OogMFqjVpi32cKgeRhYMJy?=
 =?us-ascii?Q?8IyaRRy8tfhOUHrPxpnJYNgy2zCUV6A+A0EsW9ydglWMbItgwkN3biNCr/Aw?=
 =?us-ascii?Q?QfgRe2q9GsOUPa7UOdL0hHSL52r7z26IIYASzgkv2E4s0d8vRFtfRujUrqBt?=
 =?us-ascii?Q?0mlBOk5SRsHx3R710uqrolR9DFnU6KmpJNL8TrmDQdeprBGea1gTpF0Deimk?=
 =?us-ascii?Q?0a7k6SvLf/S4Ti/SyaNXKew3qZsDwuMmBLPfwEXkByDoj16RQocBYaPKxs2S?=
 =?us-ascii?Q?h5qrs8GV/olzTz6gFzJjoeCgnbWEEc+rsky0nQ/Mj69wYpnShKv6qqSwa9Oy?=
 =?us-ascii?Q?lAmSz/74GTenVYUwYlLnpSf9zxUd2IPQE0+kNjK5svDbBXUHcCpdt3HfMfHq?=
 =?us-ascii?Q?kfjkv0bocD7bkcpw6CyeEE3HvfyIHBX+qG/impQG5TRkNiAihCXPAhRlbjph?=
 =?us-ascii?Q?YPpKk1ieS35FUfdV2vGq7Mhd3ApRrG3D1Cqf5MIuoe6gt3AM4SuH+jIj/qg9?=
 =?us-ascii?Q?0bAFMIc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6863.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9597c95f-c796-4c21-dcd8-08df401dbdaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 18:00:58.8919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_100102_197335_1EEDD875 
X-CRM114-Status: GOOD (  22.83  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Friday, October =
30, 2026 5:14 PM
>=20
> Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
> route them through the RSI_HOST_CALL interface, which takes the IPA of a
> per-CPU rsi_host_call structure as its argument.
>=20
> Add hv_hostcall_array as a per-CPU struct array and allocate it during
> hyperv_init().

A quibble: This statement is a bit misleading. I think you mean it is a
global array with an entry for each CPU.  The term "per-CPU" typically
means something allocated out of the per-CPU area.

Michael
=20
> The allocation is gated on is_realm_world() so non-Realm
> arm64 Hyper-V guests pay no memory cost.
>=20
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/mshyperv.c      | 27 +++++++++++++++++++++++++--
>  arch/arm64/include/asm/mshyperv.h |  4 ++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index 82572c5..46ab2da 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -14,12 +14,16 @@
>  #include <linux/arm-rsi-cmds.h>
>  #include <linux/export.h>
>  #include <linux/errno.h>
> +#include <linux/slab.h>
>  #include <linux/version.h>
>  #include <linux/cpuhotplug.h>
>  #include <asm/mshyperv.h>
>=20
>  static bool hyperv_initialized;
>=20
> +struct rsi_host_call *hv_hostcall_array;
> +EXPORT_SYMBOL_GPL(hv_hostcall_array);
> +
>  int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>  {
>  	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
> @@ -110,6 +114,20 @@ static int __init hyperv_init(void)
>  	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
>  		return 0;
>=20
> +	/*
> +	 * The RSI host-call buffers are only ever used when
> +	 * is_realm_world() is true. Skip the allocation on non-Realm
> +	 * guests. A single contiguous array of nr_cpu_ids entries is
> +	 * allocated; each CPU indexes into it by its processor ID.
> +	 */
> +	if (is_realm_world()) {
> +		hv_hostcall_array =3D kcalloc(nr_cpu_ids,
> +					    sizeof(struct rsi_host_call),
> +					    GFP_KERNEL);
> +		if (!hv_hostcall_array)
> +			return -ENOMEM;
> +	}
> +
>  	/* Setup the guest ID */
>  	guest_id =3D hv_generate_guest_id(LINUX_VERSION_CODE);
>  	hv_set_vpreg(HV_REGISTER_GUEST_OS_ID, guest_id);
> @@ -131,13 +149,13 @@ static int __init hyperv_init(void)
>=20
>  	ret =3D hv_common_init();
>  	if (ret)
> -		return ret;
> +		goto free_hostcall_mem;
>=20
>  	ret =3D cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE,
> "arm64/hyperv_init:online",
>  				hv_common_cpu_init, hv_common_cpu_die);
>  	if (ret < 0) {
>  		hv_common_free();
> -		return ret;
> +		goto free_hostcall_mem;
>  	}
>=20
>  	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
> @@ -150,6 +168,11 @@ static int __init hyperv_init(void)
>=20
>  	hyperv_initialized =3D true;
>  	return 0;
> +
> +free_hostcall_mem:
> +	kfree(hv_hostcall_array);
> +	hv_hostcall_array =3D NULL;
> +	return ret;
>  }
>=20
>  early_initcall(hyperv_init);
> diff --git a/arch/arm64/include/asm/mshyperv.h
> b/arch/arm64/include/asm/mshyperv.h
> index b721d31..aed0aa5 100644
> --- a/arch/arm64/include/asm/mshyperv.h
> +++ b/arch/arm64/include/asm/mshyperv.h
> @@ -61,6 +61,10 @@ static inline u64 hv_get_non_nested_msr(unsigned int r=
eg)
>  				ARM_SMCCC_OWNER_VENDOR_HYP,	\
>  				HV_SMCCC_FUNC_NUMBER)
>=20
> +/* Per-CPU-indexed RSI host call structures for CCA Realms */
> +struct rsi_host_call;
> +extern struct rsi_host_call *hv_hostcall_array;
> +
>  #include <asm-generic/mshyperv.h>
>=20
>  #endif
> --
> 2.45.4
>=20


