Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZBFZR0FX;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=XSyB9HZB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tvDL+JTCd3LfYoIRrkmZFykqOvWNjnWdVwHIkVn2/M0=; b=ZBFZR0FXxBgUea5rlIpATxMQQq
	KdZaNDBF+ALfa3QM7SN++tRtIVV/tJYDxP+J2uWoYrIfxiZvJ3BQV/VCfpc5ZgT3Lo2cmDf2RMVea
	qBphf4fH5n9lkSU3XXKpNqYVNd650/sSzJ5zoFKqrTQl9gzXywI/HqiPxx4KKUi26ECz4GNkLiMk+
	zgqLMooGslhZvTI6OZOVDShmsl9xEuwcIaY1zHWArJ5ta5XqiARTgSc2NEun5LkT7cUveh5A/r6rr
	73Y+Uc4wmKGI3fOSl3BzL+0umM4jxNIaEkjf7r4LdkXiWP6tAHua/HaBHq5yc3Z0CVzA6Wz7F+4lg
	x38VMcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1i-00000000caf-243Q;
	Sat, 28 Nov 2026 09:47:26 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1f-00000000cZX-24dW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:47:24 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b08a2;
	Sat, 28 Nov 2026 17:47:20 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: chleroy@kernel.org,
	tglx@kernel.org,
	bigeasy@linutronix.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] soc: fsl: qbman: Disable manual unbind of portal devices
Date: Sat, 28 Nov 2026 17:47:19 +0800
Message-ID: <20261128-f81b700d6c-u20-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218d563403a1kunmfc8b67a04521ef
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUxDVklKGkpLGBlKTkgeSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=XSyB9HZBF9Wszkd4nB72AD7wt4WFkjetS6+r8AYSVq3AHkqutc7PkJNK+60hUQzwaJHzHJk3Cc6vvW+ChX5lo8JaKBKnhDdg8DZipSaaZAX8avmPRl3LNKk7PB9r4Prw8QSbI1KltVgtoZZ0UUr9ghMF47zZUcTXsdrQICIBMDI=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=tvDL+JTCd3LfYoIRrkmZFykqOvWNjnWdVwHIkVn2/M0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014723_756551_553D6DCD 
X-CRM114-Status: UNSURE (   1.99  )
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

Keep the BMan and QMan portal devices bound while their facilities
remain registered.

Guangshuo Li (2):
  soc: fsl: qbman: Disable manual unbind of BMan portals
  soc: fsl: qbman: Disable manual unbind of QMan portals

base-commit: 9592e3c9af2c97cd7220c22ecab97e0875a0f51a

