Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ne7K3c78;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gds1zrGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DCpWSp/M5LKclo/Ms5TofKoWj6yGMkGVnhoSpcpUUmE=; b=Ne7K3c78CrXZ3F
	NXJnihx1IYk2Qq95WxsJhgztprQLOYMULnL16r45COikOkpU6fLxRY3ADX0z9UWZMlZ9nzqcfJ1dV
	RQiKS5NkUfzIw9y8wEbQdw/k8qx/KdIs9Xoz12qfQ1Qf0UY56NlboCMgXEUj4Pj/D6nMQQT4+cdq4
	GdihFPq+Zlmy+Pajudt+YtKmLgUy0Kx2+W7HiFr5bkAGyUK74gvcsZ9ntLfEmj+THrpaSKM9Y+PwQ
	7PAlJsJz1fjdgaRqv1cwFnJ9FmsmVniAcaUrS07eMD8x4vA3A4oSBitvzmlWJMixMbmI289W9KwAV
	fUmdlCfAPklMcfN6n4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQg-0000000EYA6-2Pe2;
	Fri, 20 Nov 2026 10:01:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQa-0000000EY8m-3JUv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FAC0461CA;
	Fri, 20 Nov 2026 10:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E09D1F000C4;
	Fri, 20 Nov 2026 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168868;
	bh=DCpWSp/M5LKclo/Ms5TofKoWj6yGMkGVnhoSpcpUUmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gds1zrGokF4bTD5/MTaN4CvuKIDPLDsULAnnljkmdtnA2gZVBQSVYahlnWRnRom4F
	 xAwenH/8fqhDXN5rZycHXGvvMMUGO/N1Htc+Ds8/DSTnTtmhggqRYaTgPwSeVhkx0w
	 ED9EV1r4Vkf3Is+PQUlfcFs2SLHeHhfXeywWGdXF7kbcx4+uOr0FAWjriB9u+1ca20
	 uJu8SjhXefllS1/WQL2GNu6NL9LGjvr17WkFP/h9c3TsaKXWgvN5Y5+612ihgqbgsv
	 ip2g/RAx+8ixPkYQg61/JqWByUeUcUdZSC1iKnzKbc0ExH+/v4jNG0Dfypln0wE14t
	 KFBTFatjyURUg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260919001931.723402-1-rosenp@gmail.com>
References: <20260919001931.723402-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] dmaengine: bestcomm: use platform machinery to get
 irq
Message-Id: <179516886582.45276.6670084747027138465.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:05 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 18 Sep 2026 17:19:31 -0700, Rosen Penev wrote:
> platform_get_irq() avoids having to explicitly map and dispose of an irq
> by having the platform_device machinery take care of it.
> 
> This requires replacing the device_node with a platform_device in the
> bcom_eng struct so that platform_get_irq() can use it.
> 
> Conveniently, this also allows getting rid of of_node_get and
> of_node_put as the platform_device machinery also handles that.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: use platform machinery to get irq
      commit: 79e7dc8807afc1bf37861f893c8a0341e4238c3a

Best regards,
-- 
~Vinod



