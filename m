Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDF606F5C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BV706nTs;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=TVP+Stmj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mbQLA9RhCWmXcAWxbqzsBqYRPUnBHPgRA659HER5bFU=; b=BV706nTs5ieysI
	3CmHSnZ6iRRSGYp/R252HSjvFJ2+EfqM+U0henguo+6xMc6lp9k47YF/7moBv5yU4zNX8IzHXRm77
	SZ8yPRxVxSY3bzSqH6ekyww4+z1MpV5RFtjfa3RlUfHNDB+4EU4Jcou8Q1wiTEagxmpnkuvY/FfbV
	zbQH/Obu8hAvVutULFU0MYgbpQQsPLn1lBko4At6smnBCWb11TXjPMZgmhAu8U0CBPtUiMcIlgg7Y
	ZcbFE1p9bniSigegjSl1wAnbzcoIEH2jBUbLRIm2PmAzqhdGL89KLyVzxy2Z59sVz927Fvg7eFSKE
	gcd6YDaD+JlNvDaq5MeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuXU-0000000DfmO-0Mo0;
	Fri, 13 Nov 2026 16:54:12 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuXR-0000000DflO-2FUz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:54:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quyeqhBU1ZVELHVUmh2Ul5oQY7D2gxBziNZXxIaJucJ2xh9Wod2T9RFcifEKjMgJrqcCVOqWRhvj2CY/SYuacwWM4Mq9NA+wxpFcxFTpU1nKntGbZbkv9rnkm2cfXlOCEdU712nRMSv27U+8yePDdGkYVmgXSe+Lw/xCNTTfgenn06x64920LN7gJvhpaSqHGTHaek77WhayB4nU6F6KdsNPj5tSTdt8agOr6wYoOevIO1+7C0X9Ij5N0UmNNMvUOcgStrc9sLqs08eVX45wNhMxM9/atHRwR/yG8bTmCtFnL7dsqHGRX/UIPWr7u55SogJGQtE87bU9Q1kLYdxsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbQLA9RhCWmXcAWxbqzsBqYRPUnBHPgRA659HER5bFU=;
 b=o4GNV3iE6/doAHOz6MhTXjTrbdGXT5XEqlmf6VVrVmLGaMbF/Vhp9vEPigvI+pr0jr8e881cjDLRR1/L+VrRpghEXQMKEmeTsi/EkTNWrdUIdZHHrbmS6uKwGsE+K/LEbQoGCP+qwrS2Iw/17AceLcTKlRaw8jf6+dve7+98tEbYvjqfgVzyh4mOXjQW0FCg7HwYOCNWTXSJnZ1SL2Gn6m1FZvMjkd6NclfatNRP16D4X2dpM3yYVIQQnvhvPC2pXNHRyF+qP5kOL/BUnZw4GcjyMsHHE0Sl1a/qqfZxKbhIu28yZQgeWPxBGM0oCXtPLmA5HWfYxUOVZQUvxkS39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbQLA9RhCWmXcAWxbqzsBqYRPUnBHPgRA659HER5bFU=;
 b=TVP+Stmj5HP2lRUFtAZBmLGTVK6T3fXOOhJTBW1Ox66dTq8pNRN2/41rSDkfJnu/8iyz2jfv86VxCkwExNU9IE7bHxtSeUqa69B89a2UnVps8s+8GbTiT0Uw0cwGQZpephomPp5Uk/aMyxgheTT631JO1fkNeEFfdD6xWkrOv4BYIjcyZeMtvvB8fXqhVs0iunbYP3o4bTR/sB6BK1DQ/43SsIoF1gkb3oT879iWmx4Gh/TC5GJPuVnZyCHz3jAhVhpJj/57kYgcR4n6jQuD+mRx1irZ/B0/6HGn1Yjgj/KhU7oURG2ik7E/FFNNvuvEfZlQSzhDh6E9VcJqvtoNMg==
Received: from AS9PR06CA0473.eurprd06.prod.outlook.com (2603:10a6:20b:49a::25)
 by AM0PR10MB3667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 13 Nov
 2026 16:54:01 +0000
Received: from AM2PEPF00070CF3.eurprd02.prod.outlook.com
 (2603:10a6:20b:49a:cafe::3) by AS9PR06CA0473.outlook.office365.com
 (2603:10a6:20b:49a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 16:54:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF3.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:54:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 17:54:39 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 17:53:56 +0100
Message-ID: <e996f9ab-6373-4a27-b5ae-591ba33845c5@foss.st.com>
Date: Fri, 13 Nov 2026 17:53:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Marek Vasut
	<marex@nabladev.com>
CC: <linux-mmc@vger.kernel.org>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, <kernel@dh-electronics.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20261030215427.488298-1-marex@nabladev.com>
 <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
 <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
 <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
 <CAPx+jO8=nVBUuOQ==Q66nOnH+VeXur88DetmETe8qmOiS_NCWQ@mail.gmail.com>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <CAPx+jO8=nVBUuOQ==Q66nOnH+VeXur88DetmETe8qmOiS_NCWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF3:EE_|AM0PR10MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8459cac2-f557-492f-cb27-08df41a6b73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|261021123027099003|11063799006|4143699003|261026121527099003|56012099006|5023799004|261009223027099003|261021121427099003|18002099003|22082099003|261102123227099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: MlGW5nof5PIUMgnFmp0GQVdBvFJBFCu6tEE/nMXCv4xbQG5ci/XSPSNUHy0ON+rj9yfKRuetAwBLH++J0aWNr74z8Nk41tRfYR5Fo0OKIQGhtIZU0768ssX5TfFpZoRBg9ZvTx+QKwSIJA5ZcnExur/BdbNB+shEOZo6f4EJJrRgdHbSYoFJTYyFCOWHsK7wAPb3s6UXmtEHwtXeudVeKxMiKt2ITNNdYa6VBJZ5O0WQFzGIyYqeDt+FKrRrbgCY/ExCAFO/XY4W/6Vf9wWOGRf2jR9mKJyPmV6G5W5LQZYT3W0EbNV1GsEC6DeFZ9jAY0J6Mrgl8v7m+EtqYBHTwgJop5cTz9BcITiUzWMEbt0mWqJbGxsuUnpaZIkNptiKyTQQjlJ5mW0XpRlkUe6Mjnn/qiwIPt/fiEYQsFTimqyYndTzFAvqYMxs10f6MbV4Vs2MnCnhz5rYjFsB62noFOHRL/fGrypYZSMRLt8yoyksi8ROsYor5hIHK+2s6WDOCxIm/YlSqYderwlZPJxk1O1XIGi2oltRKicn0BxiEC/nRxlUFW2SHFTKIcdQlhcNcEiKZfE+OI0VsLvuUeAARl/eqzz7gYp6wpWOu5Mk+KsGapHe91rqu71chmgzhvVmMi7ouyqhDlrN5PHF+rZ4YoPaKA5hBM+bRf0/OLUXoe0=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(261021123027099003)(11063799006)(4143699003)(261026121527099003)(56012099006)(5023799004)(261009223027099003)(261021121427099003)(18002099003)(22082099003)(261102123227099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /N6tdmRDO3+BvlHUnhT1JBpG3baSeZoK8DhYXjgJd7GSvlS+jvG5EdDIzcD16ztc2DDTY5FWaxckJqrsmuI/f7Gy3RzaR2qoT1viRoJ+ValDxPBYzaUhSqi11OSpUt3a1jpxCGsLV8OQ6xbENM00i+lubbCA6zEPzRekpd3m52bMykdIqLCiw+AS2YevBcZ3eZhPUA++lzSXvnn6wJTdOwQ7XQxsG2WVYtpm/A26G/2SXJCjmw7WywiON599ZYUZ4mAkeat88Qqy/6CzdGfk3TqoL+0HVzmzII8oh7D6vSY/gUr+WkmOs09xbHPt5zXKzBGrAmScuD1HdjHAbCRb99GcXW0QTorF0Ck4UOYUjUbCzHOGlhBBAmiwLS7HYsLYx6iN4gceJfz3mYNEVkU0sllWPbniEGYC0Ulqj/zbWszTh2Hmnm93g7bj3vFTgy/S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:54:00.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8459cac2-f557-492f-cb27-08df41a6b73f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_085409_661385_66DA84D5 
X-CRM114-Status: GOOD (  18.08  )
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

Hello Ulf,

On 11/13/26 12:46, Ulf Hansson wrote:
> On Thu, Nov 12, 2026 at 7:26 AM Marek Vasut <marex@nabladev.com> wrote:
>> On 11/11/26 12:45 PM, Ulf Hansson wrote:
>>
>> Hello Ulf,
>>
>>>>>> -       if (ios.power_mode == MMC_POWER_OFF) {
>>>>>> +       if (ios.power_mode == MMC_POWER_OFF ||
>>>>>> +           ios.power_mode == MMC_POWER_UP) {
>>>>>>                    /* Only a reset could power-off sdmmc */
>>>>>>                    reset_control_assert(host->rst);
>>>>>>                    udelay(2);
>>>>> What exactly will this reset?
>>>> The controller.
>>> Okay, I see.
>>>
>>> In that case, this reset also makes us reset preceding updates to any
>>> other registers, for example the clock register. I would not recommend
>>> doing that here, but perhaps there is no better option.
>> Does that pose a problem in the MMC_POWER_OFF/UP state ? I agree this
>> would pose a problem in the MMC_POWER_ON state, but here the card is not ON.
> I think it is a problem, yes. If you have a closer look at what
> happens in mmci_set_ios(), I think you will agree.
>
>>> If I may I suggest an alternative solution, perhaps we can manage this
>>> in the ->runtime_resume() callback instead. If the power_mode ==
>>> MMC_POWER_OFF, perhaps do this reset there instead? Would that work?
> Can you try this?

I have sent a new patch based on your proposal:
https://lore.kernel.org/linux-mmc/20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com/

It works fine on my side.

Hi Marek,
Could you also test it on your board to confirm that it fixes the issue 
you reported?

Regards,
Christophe Kerello.

>
>>> Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
>>> gets written at MMC_POWER_OFF. This bit becomes cached in
>>> host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
>>> intentional?
>> I _think_ so, this seems to be used to power cycle the card.
> Well, we are not power-cycling the card at MMC_POWER_ON, we are turning it on.
>
> Seems like we could use some support from the ST guys to understand this better.
>
> Kind regards
> Uffe


