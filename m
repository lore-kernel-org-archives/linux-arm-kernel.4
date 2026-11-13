Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90140606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tpf7ZoTg;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CZsPsK21
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PujtvIjLoeXZpAZ6ifkKMStRo7NhiyUQ5xqJMqtqeRE=; b=Tpf7ZoTgw2OsoH
	mQ8ra9MHTysjknajuyPgWJA4uKrb9akuS3/PZIr4qOvaPnBdbBlDNgV3BjyFWQO9OH1F7llIFqISo
	fG/KmR3gmynIDJ1ILdBgPjHh2ua/Ob2lJ9SC3+dqnJ+tlZF5nlhNZYHc+w/x6bHmIGpPt0CVI8aqj
	Jp12vkzqMO/zcQs5Mc6Q1hHZOH5RCAApXpktohxiH8zZl9wCq+G62lr1qSGOs4pODGmY4Tbql6OLi
	dJlWBGFnV8ZB2nWnVK2EQGJqBdqAJ8zORwV/JkgUjGb0V4qPot0pkWDN52Pz4iRgMOg3BIML/BM8N
	vI1X8phVOvYopy7TV+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoTr-0000000CMK5-1X0A;
	Fri, 13 Nov 2026 10:26:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoTo-0000000CMHr-0wLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:26:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAA101595;
	Fri, 13 Nov 2026 02:25:55 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC423F673;
	Fri, 13 Nov 2026 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794565558; bh=MXaBCEW7pnYGChTYZdIgJBCmAhhgs3Be++fXRUvle/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CZsPsK217kMIzDBOUH8frK2y78qdNaP8TEK8V1qTXBqKdywXLc7wioa7djEL8kiC3
	 bDLR89rSX+/VSGjPNQWj7taS1y6dwOpqL57jT19QvVxCQsTdJyDgGZbofGrQdrR5VY
	 F+enLVQAYImo+YbS2H/ik+QLfWRYSKdYPhAmH/R0=
Message-ID: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Date: Fri, 13 Nov 2026 10:25:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
 linux/coresight.h
Content-Language: en-GB
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022600_468406_D52C8A25 
X-CRM114-Status: GOOD (  14.12  )
X-Spam-Score: -4.4 (----)
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

On 13/11/2026 02:49, Songwei Chai wrote:
> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
> generic ARM CoreSight Software Lock Access Register sequence, which
> is also present on non-CoreSight-labelled components that follow the
> same architecture (e.g. the Qualcomm TGU). Keeping them private to
> coresight-priv.h forces such drivers to duplicate the exact same
> definitions instead of reusing them.
> 
> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
> include/linux/coresight.h so they can be shared outside of
> drivers/hwtracing/coresight/ as well.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>   2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index dddac946659f..0d3f6229b282 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>   #define CORESIGHT_ITCTRL	0xf00
>   #define CORESIGHT_CLAIMSET	0xfa0
>   #define CORESIGHT_CLAIMCLR	0xfa4
> -#define CORESIGHT_LAR		0xfb0
>   #define CORESIGHT_LSR		0xfb4
>   #define CORESIGHT_DEVARCH	0xfbc
>   #define CORESIGHT_AUTHSTATUS	0xfb8

Move all of these register defs above to linux/coresight.h. We can keep
them in a central place, in linux/coresight.h and drop patch 3

Suzuki



