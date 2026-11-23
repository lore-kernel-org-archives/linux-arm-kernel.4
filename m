Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZDRKeKR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvWV0NJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6Or7n0jizxWVJyA7jIKPA2rACgq3R3VfoNnp+Kk7c7w=; b=AZDRKeKReWSP57C9kQ7Jy63x97
	M/6FKYpfPbawXgp+4MtW36Jyidpn23IpuYmfvN1cDCFNnGCgTYNcOpxMf2mlfLbnjGxesotTcPwiL
	6aqwI2isjT4f5LVFfXH0+mgt+g1B/C+5A1jYC53PliXfxxzrywEDmD1iswm3DUMHkmJxuRudoChjT
	fylJWWdvqF/jXT9dMtWmboDN0AviUXai0eXyjl56Gvr7/qk8b1R2zeo53EKIkAYKw9Wt5hi73BAwg
	OMrG5eqHrjXqOfDVX0XQCljNtbAoA6gfoKVuQEopd0zWSOLLIhkz24kbfvFM1y8jHUY5nnxdnz564
	DvffXFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfY-00000004elk-4AHc;
	Mon, 23 Nov 2026 19:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfI-00000004eg8-0m8c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3F0340506;
	Mon, 23 Nov 2026 19:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323CD1F000CF;
	Mon, 23 Nov 2026 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461923;
	bh=6Or7n0jizxWVJyA7jIKPA2rACgq3R3VfoNnp+Kk7c7w=;
	h=From:To:Cc:Subject:Date;
	b=VvWV0NJdtqB/ylBE4iXOw7thFxymk5LTD6vQhJaVPgpc35eVUZn3El30g7HAhnKCV
	 8ErSNcY+02tLGFuMkq3mi2im9gXWo4LhUSdrMkzpkSyvSTzeIDetbb7GJxcbkHygs8
	 BlPYZoBX4lI7olq8TxLoi94Z1Kf4BFyqkJn1WRItvDYupl80mXFz9WxmpO3S+W80sL
	 HHPJCDvrXoJpK+M5uhaGR1aGAFlBiJ8Qp1HGv8cMZYevwIfGse8cfp5wnWhCKK/WVa
	 QGTiKhU9u9PLqB/Jt5Ir0zXIwv41AfAx8A2i90Z4ObCd1Wk0te9kZVwVxBptz2Hq8N
	 sOML+uHsNOo3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xVZfF-00000002A6V-06IM;
	Mon, 23 Nov 2026 19:25:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 0/3] KVM: arm64: Convert GIC idreg sanitisation to the confic framework
Date: Mon, 23 Nov 2026 19:24:54 +0000
Message-ID: <20261123192457.8700-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Having started adding some sanitisation code in the idreg department
with ID_AA64MMFR3_EL1.S1P[IO]E, I'm back with some more and trying to
wrestle the GIC into submission...

These patches add zero functionality, but aim at setting the basis of
a much larger sanitisation goal, where all idregs are checked for
consistency and the resulting constraints used to enforce the other
sysregs' behaviour.

Patches on top of kvmarm-fixes-7.4-1 (the only one that is currently
in Linus' tree...).

Marc Zyngier (3):
  KVM: arm64: Add enum support to idreg sanitisation
  KVM: arm64: Add GIC idregs sanitisation to common framework
  KVM: arm64: Drop open-coded GIC idreg sanitisation

 arch/arm64/kvm/config.c         | 100 +++++++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c       |  45 --------------
 arch/arm64/kvm/vgic/vgic-init.c |  31 +---------
 include/kvm/arm_vgic.h          |   1 -
 4 files changed, 100 insertions(+), 77 deletions(-)

-- 
2.47.3


