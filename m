Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E6606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O9L1yLWA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RaowZB/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AwNAeOOEuNDUA4AaaId5KqgQe8BRoEb1zw2ve0Lhbyo=; b=O9L1yLWA1XFbHJ
	KrttWQApiRDRvqXa7l//XCkPer+MSt3Qv7dIItX6b6aBmB5UStH280ydUveuXCW8ig6+Hv+O8/tiU
	Rf5UIOVJkfkcC8MBT3PwWdTfmhiPon7gnVAH6U+nhR92nLuxoon34upYnweYwbh1VwtWVmw7apJnK
	F3z4Y7/euy18RLZVAxE0h9icVyzWu2UqO7IZmWoU9pRs7jA86G0IK6AroBI+Keaa2NFviL9H+Vqls
	qDGH03YbhrsSUmq4OlvBp5vv1EwOdP7uCugp4sA7tm3nuCSloV8Ec2SGhnPqPmJT2nuv9CyHqSA/x
	cg1gEnI3TRqzNc95kBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU8-00000000Vr7-0Jsc;
	Mon, 09 Nov 2026 11:24:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU5-00000000Vpk-1Dtb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:24:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56751169E;
	Mon,  9 Nov 2026 03:24:17 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E90223F85F;
	Mon,  9 Nov 2026 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223460; bh=Kkmftib56f3AMxIKdYPPCjung1RFBfnihXj5m1EZsbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RaowZB/U9NPIcmp5vOjzWHMob9hYbOyG0rpHtd+SwdV34lNqRtzbgfNdyZqgUZz0L
	 3RzdmI2YQyhWGzMSgk5JUQWAP1ayb+zBdew+kv6yNE0O6Vu27tjPlYSa0PGUxiNhmg
	 GS2QaSNACRh4RkxEo7gzuO3Wxp1pj8jWButJrNeM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/2] fix clock refcount imbalance for all Coresight platform drivers
Date: Mon,  9 Nov 2026 11:23:55 +0000
Message-ID: <179422341588.3275439.4801778261959568174.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032421_377507_20FA2E7E 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 10 Jul 2026 09:14:46 +0800, Jie Gan wrote:
> Found a clock imbalance issue when remove the CTCU module.
> 
> coresight_get_enable_clocks() enables the programming clock and the
> optional AT clock through devm_clk_get_optional_enabled(), which also
> registers a devm action to call clk_disable_unprepare() when the driver
> detaches.
> 
> [...]

Applied, thanks!

[1/2] coresight: Fix clock refcount imbalance on platform remove
      https://git.kernel.org/coresight/c/c2d0f71617f4
[2/2] coresight: tnoc: Fix clock refcount imbalance on platform remove
      https://git.kernel.org/coresight/c/69285a3b57db

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

