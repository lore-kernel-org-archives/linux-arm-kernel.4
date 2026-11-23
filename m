Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0B606A683
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LqlfcxNK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDdLjKjl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JiJWtBiXq1+5RKYEMTg+aa/FLub2kV3/FMeSnrSIRCw=; b=LqlfcxNKnijVe2
	lMw+4CbhHFDII6xpEt/nHC6gt5aEI3iwNT+KrQuSlbOsCqLKvSJmZQAadoAo1yLB5aN6ITQepNSY3
	G9VW2QqGHwBIwRyz/xPd68NHccWdBowcVa+/13IxyUhbuGJC2Tfs9Rz7skQMJDiSb1d9e9/N2OAdE
	Kgl10YrZlyF0Qh+fKwakKj1bjKjgceZlHa+nlcgguspvuBADdYQkpwZOyQUdDjczHzkDhps5Wei1w
	ETauSLJvpIERaDaDfWE4qGuLn7qSYLpRj2L3HyQGQcAJiTr1IwYsq/si2/SK/7pcB9byZgXnZk0rw
	cDHOQ2uj80bCHJky0HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXL4-00000004GeV-205y;
	Mon, 23 Nov 2026 16:56:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXKe-00000004GZH-1lro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:55:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 155B0401DD;
	Mon, 23 Nov 2026 16:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAC21F000EC;
	Mon, 23 Nov 2026 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452955;
	bh=JiJWtBiXq1+5RKYEMTg+aa/FLub2kV3/FMeSnrSIRCw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TDdLjKjlFLKf2tWyUFQNB/8I4PmHPudG3ijiqjF1mjYsppIOCwVBJDZqGbyUK0/mn
	 NxlAKUbHFfQBwdT3EaeZ4iRFoFI3oVKv6sRfmiGAlO/m30cjkPXZu6O9skJ7Pft41N
	 mnpxFTmK0wCireiGpp4wnYw6bJcOr+v/Bi5JO4aE4jHIdbfwapfADLKPFNXT9BX6bb
	 eC3IMfp/rIlC9zxGvGxy5mhBJR3KifFffOiT2257LqIx3IKxTUXPOiFP8KAp/NrIu3
	 Mgz9KXlBwuLdtdRwT3REUbDUgVRNRmki1gBZWYM9h7Y/hRdnyRy/WZ/L0ok0CS2wC7
	 B3ssegoNWPoWQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 4/6] clk: cix: Register the Sky1 AUDSS IRQ auxiliary
 device
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com, 
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 tglx@kernel.org, devicetree@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, radu@rendec.net, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120053529.371923-5-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
 <20261120053529.371923-5-Jelly.Jia@cixtech.com>
Date: Mon, 23 Nov 2026 11:55:36 -0500
Message-Id: <179545293652.209212.10772184134283516103.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=650; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gy5VDOsHr+MXi/hQ1HMI05+dsbHa9lnkZnbNKtej0a4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZCoTcjj+xfT1hb4vL7j8PFq1V+LAiRDM0onv/jk5B/
 9CKM9YdHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE8QHDb1amd/xn0p1L3kfX
 z+s2vtLGEaq2yUci63GE9IPbIvUOUQz/M9NOmK/W4pg7y+SYHmNhmkHxzbzpKRevcJw03MrPd8i
 HGQA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Register an auxiliary IRQ device for CRU nodes declaring an interrupt
> controller, following the existing reset device pattern. Share a raw-lock
> regmap with the IRQ driver so its hard IRQ callbacks can access the CRU.
> 
> Restore the parent before child IRQ delivery resumes using noirq
> system-sleep ordering. Use the same PM callback macros as the IRQ driver.
> Auxiliary child teardown must run before parent regmap/runtime-PM cleanup.
> The existing reset-sky1-audss.c is unchanged.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>

