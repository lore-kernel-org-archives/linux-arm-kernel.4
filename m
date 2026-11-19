Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J4oAK+96;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6wxq2l7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hRnWmfScATD3nQzk0VPVzsF6FXjE11MnTpihYFOM0gM=; b=J4oAK+967kwweN
	ivOSclvEUTnc3RAc2yazo6FvnBEZE53k3+eC0Zj6Atj/g37S45X7jNYbw3o6tlZE+O4cl5gSlx/dt
	8zWekWM8HtGS0Pobztca49ssYUzOC3O0C8rm61kl85+yEuI7MypatdrFeLnyq3urj7wanlhxxDJ0B
	FHloYaWOeh0/0GM2b9rtIx3XQyEpfcu6BdmlmhPpLFpKWIr+RBnt2wjbrLDNXzqCZAAuqGJ09Sfzn
	hbLZ+4h4M+GzUCKQz1D/DoRv2chfAGloHnP0Ex9yQ76AR0bPzG1g4pTc99wVt0r9naZNG1OHVkQs/
	brap9TsHtYTdDDnn4heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UQ-0000000Btm5-1eDl;
	Thu, 19 Nov 2026 12:43:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UP-0000000BtkQ-20HT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADC8061292;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601CC1F000C7;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092224;
	bh=hRnWmfScATD3nQzk0VPVzsF6FXjE11MnTpihYFOM0gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d6wxq2l7FpYBN5F2T9OycOQ4WR5trl8sjs7e4cEqtUCJdpz854coxXt0IZBSzXfBO
	 e3dEnXtq1b3e/PCFzsr4XlkWhct/3Km6q65L8w7BQb35cnrM6SCglfIgVEs0Qsw4DK
	 VGpaD/c0ygUGVf5eg3Xj4XlyUoCkZU1X4v+YobJJ4VdEBc3H3ZDRksE46ZG72RUgK/
	 UNl0tBboWi7SPIkgI+Gj+MyuLAz+33l2h17lg2NgLO95vyom6mOxXqInowuSleOmB2
	 tPS0gYns9cs4qgSXJXLpFwUP1572CmLQ0Si3KdAxHz/C5OUB7S8NQyBRM1H8nxjWgw
	 2GRhYjvt/kLlw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1UM-00000000RvW-1rl4;
	Thu, 19 Nov 2026 12:43:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: Dan Carpenter <dan@pereq.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Blaudeau?= <clement@cryspen.com>
Subject: Re: [PATCH 0/3] KVM: arm64: nv: trap forwarding bugs
Date: Thu, 19 Nov 2026 12:43:31 +0000
Message-ID: <179509215918.3938200.11293350722517708122.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795014776.git.dan@pereq.eu>
References: <cover.1795014776.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dan@pereq.eu, catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, oupton@kernel.org, seiden@linux.ibm.com, suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com, karthik@pereq.eu, clement@cryspen.com
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

On Wed, 18 Nov 2026 18:29:39 +0300, Dan Carpenter wrote:
> This was detected as part of our Formal Analysis work at Pereq.
> 
> Regular KVM and nested virt traps have been getting out of sync.  Fix a
> couple bugs and add a boot time check to prevent future bugs.
> 
> Dan Carpenter (3):
>   KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2 traps
>   KVM: arm64: nv: Forward CNTP_TVAL_EL02 and CNTV_TVAL_EL02 traps
>   KVM: arm64: nv: Report EL2 registers with no trap forwarding
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2 traps
      commit: 88fa0c91640ce163190531bf3e975c73c77d7c7b
[2/3] KVM: arm64: nv: Forward CNTP_TVAL_EL02 and CNTV_TVAL_EL02 traps
      commit: fb32e91ac511101f528fa2f33cb1904b3796f5c3
[3/3] KVM: arm64: nv: Report EL2 registers with no trap forwarding
      commit: 2fec206f37582b9295185a86e43a08ac74e149d2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



