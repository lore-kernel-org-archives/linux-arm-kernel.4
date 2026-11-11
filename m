Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831D606A885
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=seH8s9cq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IZZbUuBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5mnfgvT8zDKrs9lwYAztCT3HXSYhGYY7tbHNuk3ABB8=; b=seH8s9cqbuWHID
	vQ8aTIRVyiQ/md9tF789+rsuRzzJb/Vici1k8c2oWj2SI0R/IOvEF29sAxfK/2ivsnggzL8UekjN8
	EipBbm8zW1oWBEotWYCrh6byImu47gLmleDbDaqQWq6egdkPPtMDkI85bViXd8yq57lAAc9ST7Z1V
	5vDdeg/wTpzVT/5YF+zWEpT59G8b4jnL9i9IPBOw/n11evAjgqPLfMfCXJ/j3CtVP3BiW75TBEy0b
	YX9pumo7HS82onkSzNuPdOHT1YpKFQy/tglWJdnuaWPgyQvG1u2BJZjqAwYMsToC6PNbfQcOAMfDK
	y43tU9rkn+UbQABRifKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHFq-000000084rT-3LhE;
	Wed, 11 Nov 2026 22:57:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHFn-000000084qe-3RG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:57:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88131153B;
	Wed, 11 Nov 2026 14:57:13 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF713F673;
	Wed, 11 Nov 2026 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794437836; bh=1Bszywrh8kxNWtqksE6W1nJw34lGPEZHi388691QkMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZZbUuBK5T6vqLzLFvjVq/NhCQm7F3/Y2triF6X4DJc6/uuxViUcb0hvEyR666mL1
	 98XdimpnEnDuHul+eHZf6areafHsL4to4Kd5WluHEPLr0/kLhGvsfh/n5+Hdy3+sDP
	 IEXTlMoR2LJmtfwRGBPqk5GAsRv77luC4Htj876s=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64/suspend: Save more registers over suspend
Date: Wed, 11 Nov 2026 22:57:06 +0000
Message-ID: <179443782601.2846601.5634691195882176337.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_145720_006694_7C4C26BF 
X-CRM114-Status: UNSURE (   5.93  )
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

On Thu, 05 Nov 2026 16:05:03 +0000, Mark Brown wrote:
> While reviewing beeec0404622 (arm64: suspend: Save and restore
> TPIDR2_EL0 across CPU suspend) I noticed some more registers that we
> need to save over suspend, fix this.

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: suspend: Save POR_EL0 over suspend
      https://git.kernel.org/arm64/c/2386c3dcf13e
[2/2] arm64: suspend: Save GCS state over suspend
      https://git.kernel.org/arm64/c/7ca488055c69

