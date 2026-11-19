Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0460A2609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bLAgDvhP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HBRuEQyY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4r5PB0DQkXh3u33w6JsWbjKrFhzV4eOWaVXY4U6YmfM=; b=bLAgDvhPSd+1aO
	xJScCczc0EtrBSL9qgVuKJf5eiiOLiUH8QZEov6jqBuA+NfX3GBsyvxCb4+qwWLVUT9Kfr0nYH0bG
	kePIkzeBETXG6f+ShEgw0/xM+Kz/pwwtjB+v1c/BzEuXwEkoTvw0r2Ut0eJ+/aB0EvLWUQa0RpQUa
	8Yw1X9AN//Zg6I6BSvYkD+BvlGz1bKPNPPOkuVsErOhrU8+8fwz0ho4/o0vdyr1ShrIFk5V94cNnm
	o5jicKPZnbFRHT93CX6Wy++qh4bNxtPzuzpdHrfIShKDIzwTj4tCW3DKyWeUcCS5muisvh9b0kyt8
	dniKw/j2OY4x5Be+LRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UQ-0000000BtlP-0oA7;
	Thu, 19 Nov 2026 12:43:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UP-0000000BtkP-0mBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACA9142B1C;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BBD1F000C8;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092224;
	bh=4r5PB0DQkXh3u33w6JsWbjKrFhzV4eOWaVXY4U6YmfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HBRuEQyYgb/ceb3U7Nk0J4WbPRthEECDLvswR6k5WI0mK1ju8s/lZFhZ5x1LPApkn
	 1pjw7ihXQvxY7XjZ0w1EMc3S9a6YtcuY5ZeaPPDW0Gj4zYQdm7O91H0CuELeROco6y
	 FK4MU95dsVf1k8EGF2AFD3J/kB9p33l5ia+AIB1c4B6Vl9ZtuuwEek4MJUqkOTGxUM
	 j7V6GI559mffl2b8Z+pIfCQClnK1cvshCsSSyRft96ckG07J7kvsnnQrixm8XvJXvV
	 vni4JQe5jEETDmfnSLttUQGHk9EgxxxjZgLBXfc0KNMkBE5tLjyW9Vq4mSnnJsHhhq
	 66JJCzlr66Pfg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1UM-00000000RvW-341d;
	Thu, 19 Nov 2026 12:43:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: Dan Carpenter <dan@pereq.eu>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Blaudeau?= <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
Date: Thu, 19 Nov 2026 12:43:32 +0000
Message-ID: <179509215932.3938200.1655577673517610015.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <av3FxJpUvpb_8qMC@stanley.mountain>
References: <av3FxJpUvpb_8qMC@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dan@pereq.eu, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, christoffer.dall@arm.com, jintack.lim@linaro.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, karthik@pereq.eu, clement@cryspen.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 18:35:32 +0300, Dan Carpenter wrote:
> In theory, an L1 hypervisor could issue a TLBI IPAS2E1 for an IPA
> above the host's IPA limit.  The s2_mmu_unmap_ipa() function would
> pass it to kvm_stage2_unmap_range(), the page table walk would fail
> with -ERANGE, and that would trigger the WARN_ON() in
> kvm_vm_stage2_unmap_range():
> 
> 	WARN_ON(stage2_apply_range(mmu, start, start + size, fn, may_block));
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
      commit: 5f9cc7dcda69ed881a3041ad992afaac2a39d687

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



