Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4E606D829
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjJnyakl;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AUpcF9rc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4oWMsz1WRA/4iyR10gjcesrSJWoNFgd0/ws2ghj/hec=; b=wjJnyaklyrX1Tm
	BBZRsQk1pRY1ZhPqTDcQa6nS7RLANeUt3YiNr2TdqrA+k1AGkVzTav4e5iQXb/5fYPvW3O/2g4pTK
	pjEZv3csMl43UffrAGFd3evAWQw+eWplTLqzyooWFmrvUB0+Y7IxSUCtwGABGSShu7TdOct6potA1
	RGncAXzIJSwC4hUODnt1jLuGasSkcgCIi6hWbWz7Warw1eaYw6+U+YZvycd5n+syaj3Iq7fZrGh/U
	sGGa1gKj/gvllDayutq+M2uzfSatFI62NHyPxPQTIgRHkP5CBzV5KJCR2oIuNPuo1oQ+zUEBjxnmz
	amuilb9U9hThiyeNUrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU3-00000000Vp6-3ZGP;
	Mon, 09 Nov 2026 11:24:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU1-00000000VoX-0QbV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FEC1576;
	Mon,  9 Nov 2026 03:24:12 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C59B13F85F;
	Mon,  9 Nov 2026 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223455; bh=kkzH8ilX2x9sZQrNQewI6dXSqwaZnr/xmC9vY8oBM5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUpcF9rcgqAfzV1VEBIiZpL2O6O3sFw9Cs0kUwlTv8wOoZOqybAMjRs6PdssdYkat
	 G4e64rdvAeCdq2Zb3d+c45hwMoZnqkSm56MGmRsogHLRsoaUrUuIf3evg/vA6CQayH
	 rgKVC8OFDnG2bWfbsz65SX7bKdVt+ishGeiyPfPM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpda: fix race between refcnt check and register access
Date: Mon,  9 Nov 2026 11:23:53 +0000
Message-ID: <179422341586.3275439.7185301847041748123.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
References: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032417_361240_6DAB7F85 
X-CRM114-Status: UNSURE (   7.97  )
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


On Wed, 08 Apr 2026 21:23:44 +0800, Jie Gan wrote:
> Several sysfs show/store handlers check csdev->refcnt before acquiring
> the spinlock, then access hardware registers inside the lock.  This is
> a race: between the check and the lock acquisition, the following can
> occur on another CPU:
> 
>   CPU 0 (sysfs reader)              CPU 1 (disable path)
>   ─────────────────────────────     ──────────────────────────────────
>   refcnt == 1, check passes
>   [waiting for spinlock]            tpda_disable(): refcnt → 0
>                                     debug clock disabled
>   spinlock acquired
>   readl_relaxed()  ← FAULT/hang
> 
> [...]

Applied, thanks!

[1/1] coresight: tpda: fix race between refcnt check and register access
      https://git.kernel.org/coresight/c/4f5f1e5ae120

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

