Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50760A2621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2dNKXRb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MZPaFkrd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXyZsHwfK2gvuQhmDt5WpMTW9zW4LN4v0nZE/aptwHs=; b=Y2dNKXRb16t9J7
	capZI//DLFxaGCCnQNC2Ay9h0bRSzvaOn1rwiJ58g8W0n1mHk0ouQeIF0Sv4yojboVhSefs8jO/pW
	4gvWGT4oBtuYpmMNFFkceaN6rizUhiMyMkkS7lCjeos9M23cQvAqJaHlKFfN4pSBQXoS1Om2gsQ7v
	DbUDD98MqXiDQTAiHpLbH7mLWoSQaRv1NbfqjR3bnoIyouq5Vbaf26JasOicwxEz2cCjdb1jX9Za8
	3hEBLfBUS+EC76XD1l1Q6GYuQV801aqnwog5tGdvYOs2n8PnKlp0+VERYo9YCjPUjWkBJR+Jz9TRj
	VnbTWD0+ZSjsMyS9TROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaps-0000000AyB2-2OBM;
	Thu, 12 Nov 2026 19:51:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRapp-0000000AyAk-0jZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:51:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA409339;
	Thu, 12 Nov 2026 11:51:44 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979743F632;
	Thu, 12 Nov 2026 11:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513107; bh=J5uksauuCqtbIoAEhUXb2nyWugeHjgl0kBp4qFlJtqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZPaFkrd/CaGNlf+0EIS5FLEDKIgvRYv3UGQsDQsuoy42IA+qOmWJSFeGzvvo3VNT
	 khv+wsJqx3LZp/+fwBE1dHXz0uRgEHisOYk4Qkr4+DN7VvtFrQiMGYr/qMRheb1BnM
	 XDyn8rSqP0W+NYlwIxJ4sgJch9QRSZkFhvE3Aloo=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: errata: Update AMU workarounds
Date: Thu, 12 Nov 2026 19:50:25 +0000
Message-ID: <179451296804.3304937.11865929990379023674.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115150_238105_1F4B7F93 
X-CRM114-Status: UNSURE (   8.12  )
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

On Thu, 12 Nov 2026 20:12:06 +0100, Beata Michalska wrote:
> This short series updates errata for AMU core & const counters.
> The last patch in the series tries to optimize a bit the paired
> readings of both counters, so that the workaround checks do not
> skew the results. It is also intentionally the last one, as it
> will not apply on older stable kernels.

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      https://git.kernel.org/arm64/c/139a9b7d5a07
[2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
      https://git.kernel.org/arm64/c/be7771458582

