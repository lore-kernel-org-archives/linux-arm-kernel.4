Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E88606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5kAcPBF;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=QKfi/K9E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ikxirt7jDYby5z6DSTG1jxO/eeWSfK+MAyMYqS8CxDg=; b=M5kAcPBFpslfMc
	VORjwfo2QV+wceVBsEWzNSEEjxeQjgWtMaP4SVYwAZlADBxkD0upMYj8vuF5hF40u6sZ/juLcu6PR
	z9QF745FH0A9yUgDrJrcV8uy97Tw/ALKL1C9RvMHgKFWXyulpHZkLLxpzJFtCRD+1gdDf04lifZfc
	23tcIOvmUl3l4r00vDLSdTk4yShZllTqtLzEudECkZ+jjzc1ZDnam7JBoQgMrTonZ2DuRNS1YU09P
	9i9SQi6ERMxvlXwMVDB+GdYN0niOHhfIdE44bzYDbYPVOotXxGL5cws5ZlTZTqpZp5fBvxLoPI0x7
	lTTROklp3QzsD2pGZFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPdp-00000002b3g-1yFl;
	Mon, 23 Nov 2026 08:43:13 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPbb-00000002aeB-0yQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:41:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6St0NFVVkTNB9JKVuKUHrXMdb7I2ttYo0nBo0tzLGbPXd9ExKI0/YcWhOdDm5jFsxjGuzTall+UZ8D4rqKdrkjXeMPBpHdsu3a/0GTFDlGzcVuf47HzHZe0j/h0yO1E0h0YIEwKavGrRU4m7mcg8Q0aDV5B3vx8pMFDFpxqAGln+5rLDIG/hSAO0beeclKpgwWBPYcUmBQIQsmUnonaGSdmF9nDNn2i+OZFmGZJgEvoF6Jj2HJIpScf8D4lR6AlfX8GH8toJejFL2kpOB+sTezi3rHDluwjsEGdg/loVkuoeSUKKo36+fqJqL0JZyOjRR8NZ9gHskcPioKpZOkCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikxirt7jDYby5z6DSTG1jxO/eeWSfK+MAyMYqS8CxDg=;
 b=O1oOIbG65ULl/9PRf2006OMMYY+8PuYiAO1FiNSqL2978HhLjwwXX/2PM6M0SCAYIyzh7jviBmqeiRHlyGjZnR+2EtDYUeXkK1cPcRnHwmuOMviVFoVsUqAOrs4wFti/nXWfCvjwJKt5gMbHYTvjY5nGnDy/LA0GhUGQ6ki1ghVydXLXAxYDdw8rrXlkNpe7gYG2YEThzYs29x+BnM3wgUIQHX/N2657L/2o0aLlXf7vn/A6pY7Amc+Og4bVa+hkdwu+1fvf5zSUyRo2uHgIoxicdi6YJRXvzSjLOJCpqmxi8A+AIUSNJa+0g6UvyWO2CkDvinDYE2W71DDIQovKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikxirt7jDYby5z6DSTG1jxO/eeWSfK+MAyMYqS8CxDg=;
 b=QKfi/K9EK75wnKdkiTfXf9eVvJIARS7uc8Hg7wWhnlKczwsWs7tlfUbLRJ4+6EZCG+Vt75LEC7+cPMWYSwKkzHDZ7OLdoKeT+eKDK6Y+nB8SCa2XPCsk60UXD2gKYQSVAZ3RaEYGvNCtrrcdMTehDU8erSnLkn9hY60X+EIj7Ov8Klgb/gsxN0Yan4M35VIdA0eEyoxmkD4dSmMPv4bXdITQuQp38EDWAOpXfiEeNMv/pwEwQrivG9IgOGqx4EDDN04siH62TZsLLM2eVjCd/rKyqwjskltbT3Q4nDF9LLYmj6W6F5ZXKxcrax51PleO57kPY4z44QBJylB6Pq675w==
Received: from VI1PR07CA0139.eurprd07.prod.outlook.com (2603:10a6:802:16::26)
 by PA1PR10MB8309.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:448::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 08:40:35 +0000
Received: from MI3PEPF00008484.eurprd02.prod.outlook.com
 (2603:10a6:802:16:cafe::7) by VI1PR07CA0139.outlook.office365.com
 (2603:10a6:802:16::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 08:40:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008484.mail.protection.outlook.com (10.167.240.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:40:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 09:41:36 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 09:40:31 +0100
Message-ID: <13394f16-8150-4631-a323-c88451c7f842@foss.st.com>
Date: Mon, 23 Nov 2026 09:40:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dmaengine: stm32-dma3: clear flags before signaling
 transfer completion
To: Frank Li <Frank.li@oss.nxp.com>
CC: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jerome Audu <jerome.audu@st.com>, <stable@vger.kernel.org>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-1-f29c1f437399@foss.st.com>
 <awCH31i9i5mCRw9W@SMW015318>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <awCH31i9i5mCRw9W@SMW015318>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008484:EE_|PA1PR10MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4bc79f-6057-4c68-73a7-08df493d7123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|22082099003|261009223027099003|56012099006|4143699003|11063799006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4a3rJib/AIiamcL2I8MN9FlvqaaMIdiwKEOjyfNvvw3NezB3zDvkDhi1sSTbgIys/1hKHCAxDyVIUaK1XjeJn453ibpBnelH+aPZdoMwB+8HT52MQHv8dbc2RiH8qa69lPFfI9mv8jGHhiwgt/t6arE+UVeAI7gJIGeBApjqrHHhRVphZ+kleMO3Q8QuU9zSwx36bHRyRuIVEHd65gF0Z3MYSHVqRaE4NME6juTvApKlIgZpmN+IWZfjjbJ5PwDkiH9bAsB/AJCwAUXWfZk97/CQM1o96e8Oh99G1kHQ9YZJ7F6a/DVQ07SS3HRqLsrtDV2wCfvRrrHP04RquOKoDQ/EGHpc/nMTkedNC5D5fSCVKzkHupeO7vZvYN6mH/BATYs0Z627I0RUqwWNCtVRoDfFzABRzvDMpOW5PJBVnr/GP3zIsdhzCu2c6HJ+5nLVM1+UY7DihINr4kQW/eKUBYr5CeGc0DTZUhm8/yHbr8ooOVidd1FJdR8C2RugTSBcaW3cuT00ovyi0fzMZOC1QlrJH8Cjbc3BYUQNc6+xmDonGc1FBRz2MtalE1W5g7e1fl1AiZjrkQoFqUWyFqn6KL0IssRKublYmbls6Fbb259mTfuhSubGbSKiQigsbUmcuIq5H658Kc4MMTK2QX1Y4l099rhxqUkjHZiSOvvEi+ekC69PuO0czar8vzSvXqIhYOAigtp9ZmCqwwPf/vpcgQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rYU6CmrI+/hlgWOCyV5WZt7zzRH8lwFrdoGaul+kZFCRNvBwzmz0gY0+yksTlg5ASznKomCNjtofp4cv7Aicva1cASaBziR+t4RLlWSMOTeFmQEwjleVS+eHRLArA2H85DzkaxYoky6owp+FEKuymYtHABP2Ja2TAH243Fh7q2e1efLkVfBNKArzsY+dSUl+rOsi4Iy82W1TRMilB5yi3fmovZQ7UzBCOh/+4/ba+/twIwKf/RWEY434NMfj/eAzOesUWREW3BiCs13rj/29zz5t7Ec/ILUr6PGeZyRLEF1N1qe5Ud6k4uaMlrIx+ZYAjQvxL7/rDgrx7ZkOph2oaBDaRWkkP02rmJGDVQcQzOO3Gpn/fFauyUDrkRaUly4hudT3hKDDTeJAypy6B06Z2GkPMq+cHjQ9dSD1jT2D9VzW30gkCsbV/kyrhGbeweio
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:40:34.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4bc79f-6057-4c68-73a7-08df493d7123
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008484.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8309
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_004055_282682_79469994 
X-CRM114-Status: GOOD (  10.80  )
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

On 11/20/26 18:48, Frank Li wrote:
> On Fri, Nov 20, 2026 at 10:18:01AM +0100, Amelie Delaunay wrote:
>> From: Jerome Audu<jerome.audu@st.com>
>>
>> On a Transfer Complete event, a new transfer can be started from
>> stm32_dma3_chan_complete(). The new transfer may finish while the end of
>> stm32_dma3_chan_irq() is still executing, in which case the flag clearing
>> done at the end of the handler also clears the new transfer's Transfer
>> Complete flag without the end of that transfer being handled, which may
>> lead to a timeout.
>>
>> Clear the flags before handling completion to make sure that if
>> stm32_dma3_chan_complete() starts an ultra-fast transfer, its TCF flag is
>> not accidentally cleared. This reordering is also safe for the other
>> handled interrupt conditions, since csr holds the channel status and is
>> used to select the handling path.
> Can you rephrase commit message. clean irq flags should just after
> get status before do actually handle. Actual handle may cause new irqs.
> 
> It is quite common pattern for irq handler.  Some thing like
> 
> Move clear irq state just after fetch state to avoid lost irq because
> actual handle work (i.e stm32_dma3_chan_complete()) may issue new irq.
> 
> Frank

Hi Frank,

Thanks for reviewing. I'll rephrase it, keeping the concrete failure 
scenario but making it shorter for clarity.

Regards,
Amelie


