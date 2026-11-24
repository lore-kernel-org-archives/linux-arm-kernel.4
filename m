Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fEy9693i;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iyE3KXc6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=; b=fEy9693iDLehxj
	9XFEmm+jgRti+21oqdRyyiOErgFLP5Lpj1Ug+n+MMxjFLIZKzZ61d9uWaiWZaJeGp9+qU66IJqPhk
	Wcua24G1W+irVebK2xVZT151MfcxVQn4ooqAljpNjczOT8DmxqzHDKCRZqPh7FJgYqgCa+YKdHW85
	mHVzWieR3UNaqv7EW8BKtqu6rIyq0Mq9rj1B1xOYi6dV++i4VCJgcnV/5NU0JqeMJqng3XcTKEare
	r1UYdSqoS6X/eCAEyX8YgHIvDHjJrqplgVAXPxoWgE00etVvnkE+pnneHGbin1uarnz/NbAXtgvon
	O9tU0Kv/O6jVdht9KzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtDP-000000075pg-1y5I;
	Tue, 24 Nov 2026 16:17:55 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtDL-000000075ma-0SCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:17:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaU8GL6LapZ9P4hcGN++I/CErDflVZtPb54u3bDkvbo8bbsHLeAJsljd4NH9DL5KidorFCQ95CeKiRCRV3CR1LCG7dxgV7f5ZqeA//ks7xOS6Ef4hScWrjmks7Re/iWDh2DqI2npxegvN7qU8z0XxQraYmv4mMJF5xMdCcP3rpWdSZMv+Vl58tA25ci8CrttGK6FbZSnSE4aOVgAsOIOd94CiITSYLocLLrZ+8LmgTkVQD9d6Drc9znOr2QSCBORw97nWJuQvr2vBiE9hu1erYp1MooXqlbuhH5Zz353kGQfpYAfWJPR0UbixLL1AdDtJWLdmhBNnDjVIi6j9Enyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=;
 b=sQyKb2pd8xTrjLds6KXqxOyfkr/OjbDOlapPulamYTDBHueNpf+VugHOjJJG8K/sRSoEiWHxKjKoV9xORFVJ3Kzu+9mevCVKNKfFxsjzcNKDmoB+XZgp/RF2LB75hzwJ5aJGVB9Gu052Lz3WeVp3104szhz/5/YXCtcyGjN4Gd50VEEusHqIs36njCyOcOVol+QRxksUy9BdRDWkWm4OtAnymxIcyYLHtokClkJ/S/0eEHgDFK/M8BOzBSaLAFoHkQBb76Y8TfqLJEYoAB7AZRxsOPjXBbJ2frhKHSseGIth3mXhbACooDuNW+/lRD9mC8eusi/PgEsW2KPhMgghSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=;
 b=iyE3KXc6rDuZ6Vzxe2pAIO9bg0+kXrLfZLd3iKyuxQx822GU5aGO1w9lcWCez8FXJ/YppXU/dTQuOX37uG/AGgoWLDCW8lN04Zdn9PDfTTEKO9ZZcE/0mTiu7AAZtKeusY2hRn2MT/oLnYJl9vbf8lOydnOMeZrUon9Su6JliLnkQUkUZL+4ozghcX7Xi8lsZEEEqnli1atGPujKMjYTdUkHFSfTSHtzcybw7KZyYcEgLW768juz194lyFhz0lJMzqmy8aspdSrBDaF1J1+espl1gKWh18DFnjjBA3GuwSERRBd949QEU/B5I8Slb+XTc5aTA9VfovTjY0bTHPY0Cw==
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by PA4PR10MB5779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:268::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:17:44 +0000
Received: from AM1PEPF000C1AD9.eurprd02.prod.outlook.com
 (2603:10a6:20b:657:cafe::a0) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:17:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD9.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:17:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:18:32 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:17:43 +0100
Message-ID: <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
Date: Tue, 24 Nov 2026 17:17:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names for
 ETR and STM bus clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179553246414.44164.14668877546162285849.b4-review@b4>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <179553246414.44164.14668877546162285849.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD9:EE_|PA4PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: beff7a9a-1888-4ea8-08c5-08df4a46789d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|23010399003|10067099003|261102123227099003|261021121427099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jquk9cbcFpixDrU5z67EXOBVn4oKXWveKnpgoDVzpeS/s6mNKu+f3FVcmiAVd6FATzdawQN0OmBZcyZGIYXwJkQ9UtNxc5UwwYa8r0572n6BRTn8vITJLH27TUvY0nw5Qo2XWjhntJSvreOO2Jm2fCK5hBnNT6aQOH+JfzN9C9WxqmjIwOtTMRWktZYMA1rsjIvwTHLqpy8zuZD653S7zynXBfUBOiNQH80yKwgvJoHJORvxCugzqqAffE7JVdoJhToR0xhUfj/hDCwr65u8D2oLdaVxBnKL2P95WucGJ/GYc0hYmEzlDEzqej6wg98ZlguLqB3dI0jV1mjXIeyTQgX23SCRxgVEBWDzbZozDUCzAcpQYW+CRmtJoIajkahl4hGCnzoPklQKWDgcW3XJmD2aHXEjgigxYX+TfuRrTckRriDaiGqrvKJl3HLvOLbDQt5+xBMxrmrLXdjtQunuEGhIW5W9GGJPdDvsWTMqI8j2wfXR4PjNIXQ4gQNVmczlvxvVaN4+I1A+hoW/39pGSnrLmpTt+8UT634VEpwtqDRJ3fC+0Sh8SardqlsVBlnvRUiaSDBbFQvciPpqr7kjKU54ORDmDwkbW+PAy15w6bXMKEpOINOjp1OH742E1dfutSCVQ6w1WOB+AoodhBsJT/DN4PTDG+bEDgQHkWmVYOmRF1q8UhxwLoyjnxIqT6JBf46Rg2bj9bqufg6oYiwztA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(261102123227099003)(261021121427099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y0khRVlBMqN5ZvAVnq3n4drrm+WPoZ1BNN3ol6WahyzZD3JRwbTrcIBs7sGV2xhqLemTfPPduRBLL6YiJkwhoJVGmG3y+VJshsbE6HnNndnQHGIYyOmL6eLwfi7lpswKR6m4nIZvjyLJLUBop09nbj0B2xNFyUYObzNeDGtnz6/aQxJ0yWA/NCKtsmKY3DfwiaEjzh2K7l9XSogo6CxnKf9vvdWQsRq1UfF6mZXk54iSsFEY+oSVI0B9tzN148VeMxDYQjGyJLvMaqrU2tRVZFdMRtBFxh3MBfbLZFcOBvyRuLwcYYpg32G0V+JTj/ZMy2n8hn58rLsoQWKvihjTVm8pjK4CRdTtbD6JQVT0Ow/j7W5ABGpRvN+p0ByX68cgNMj6Aa6/mRoqAh85A2DXJaBs6P3bDqcR0OBYJAXs/MWzh2IIi1BhVf+ebTcdPhb0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:17:44.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beff7a9a-1888-4ea8-08c5-08df4a46789d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_081751_259891_981C926C 
X-CRM114-Status: GOOD (  15.12  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,


On 11/24/26 16:01, Krzysztof Kozlowski wrote:
>> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
>> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
>> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
>> ETR is already CK_BUS_ETR, these names are confusing. They also differ
>> from the reference manual and from the STM32MP21 binding, which uses
>> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
>>
>> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
>> values, and keep the old names as deprecated aliases so that the
>> existing users are not affected.
>>
>> No functional change.
> That's ABI break, so clearly not true. Users of this ABI - this header -
> did compile before, now they don't.
Thanks for the review. Existing users should still compile: the patch keeps
the three old names as aliases at the end of the header:

+/* Deprecated identifiers, kept for backward compatibility */
+#define CK_BUS_STM500        CK_BUS_STM
+#define CK_SCMI_ETR        CK_SCMI_BUS_ETR
+#define CK_SCMI_STM500        CK_SCMI_BUS_STM

Old and new names expand to the same values (89, 87 and 122, unchanged
from before the patch), so neither the DTS/C sources using the old names
nor the DTB ABI are affected.

That said, you are right that "No functional change" does not describe
the ABI impact. I will make it explicit in v5:

   ABI impact: none. The numerical values are unchanged, so the binary
   ABI is not affected. The old names are kept as aliases of the new ones,
   so existing sources including this header still build. They are
   deprecated and new users should use the new names.

If you would rather not rename the identifiers at all, I can drop this
patch. It is the last one of the series and independent from patches 1-7.

Best regards,

Gabriel


> ABI impact must be explicit in commit msg.
>
> Best regards,
> Krzysztof
>

