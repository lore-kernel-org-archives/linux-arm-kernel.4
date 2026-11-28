Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F554606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zFMeHzw1;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gDUhwJNx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yePN8PrpbPCiSC1tx7kZdmQB5SvKUp1UQQpP2aC4bic=; b=zFMeHzw1z/7YSY7hE2/Vy3mIQ5
	+96n7m6VUx4EDbnYvkHszNEGsrSZWCAFSz7D6niM/LOUs+Tf2YOOjLAJ8/GjtPW/4douXx5zhRsSy
	oKT2htZogQuvwgZLCL8uzFZiBUfTr0rTkTnsUqqINVTEkXxn6QgI3R3Mi3w41G4KP+AST5jsV6sW+
	tCZb1YZQL117c9PW3ydgeyDTF3zu2CglHPPGdUixkfatmdYwZvvuFCbamqFAzgyYIwLFuRenfWgok
	nHv2IE/hWGMlMYP51guw6BbUIwZwN78wX/HPTl+EXh6aZ/9XYwjk1lflexZI7KkxoxIJhQ4TbWLZ4
	m8W9zggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvt-00000000b2F-1c35;
	Sat, 28 Nov 2026 09:41:25 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvm-00000000aze-1XEL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:41:23 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0807;
	Sat, 28 Nov 2026 17:41:14 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tglx@kernel.org,
	nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	ioana.ciornei@nxp.com,
	alexander.stein@ew.tq-group.com,
	maz@kernel.org,
	lokeshvutla@ti.com,
	yamada.masahiro@socionext.com,
	robh@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] irqchip: Remove interrupt domains on driver teardown
Date: Sat, 28 Nov 2026 17:41:13 +0800
Message-ID: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22187c13903a1kunm4b7c333f451d3d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk8eVhkdHh4ZGEpOGR4aTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gDUhwJNx/10G5WAdgRfZlXHC0rzugbnq06FnMDv4SBG3+/AEHl3t2y2ni2bTFmltlVLhIvbfMClqxFAQprGBrCQPgNoOtS4a4K2S+jbol627KlzMzxZ244DICU9bTC0xE1x2GPC2B6NryPERcYar/k36JT4+9VZRXSVZ9UIT/I0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=yePN8PrpbPCiSC1tx7kZdmQB5SvKUp1UQQpP2aC4bic=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014121_880008_5E309F68 
X-CRM114-Status: UNSURE (   2.23  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pair domain creation with removal in the LS external interrupt, TI SCI
interrupt and UniPhier AIDET drivers.

Guangshuo Li (3):
  irqchip/ls-extirq: Remove the interrupt domain on unbind
  irqchip/ti-sci-intr: Remove the interrupt domain on unbind
  irqchip/uniphier-aidet: Remove the interrupt domain on unbind

base-commit: 1aed0e209f0c3bb1f28d4d69c2fc23528d30981e

