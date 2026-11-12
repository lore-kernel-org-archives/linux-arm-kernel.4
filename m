Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB56606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaruSSty;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1Jm8RhE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iSWGc1+jTASEcnUfet0o2SGVDT7thSeomcVfc2dZPz0=; b=uaruSStynzG4RMSGoaPG+lTeBf
	jKfo6dfsnzfTQPataEe6CNH30XzXKCc/95NBO/JnjaC+vJQ55Uc36q++I/oO3CxI7jNeaoPEFhpOw
	13Y+9A1Yx7zjz6OaFz78AzOwQsOa1aThtlSLkgp48VXxx1jCn6t2Cpak1yfn4tmMazLvHOdvceuUd
	+kprD/j0RmNuoOnA8A3N3TGKtGvDt3U5pOvFOpS6eZ+07JTTi+8Uy/h0HSt4Hxq1QX7VVrNboi4+C
	uXEjYGFLicRK5DJ0K9GpWKj+dEhE/t23cD6DZSBeQHZrFfUZf3QD+RvNHq4qc70CXA8QjFFSAHs9V
	fD47J0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS0U-00000009WJT-3gG5;
	Thu, 12 Nov 2026 10:26:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS0T-00000009WJ6-3qVB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:26:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C3040912;
	Thu, 12 Nov 2026 10:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E3D1F00A06;
	Thu, 12 Nov 2026 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479173;
	bh=iSWGc1+jTASEcnUfet0o2SGVDT7thSeomcVfc2dZPz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K1Jm8RhEU0PBlL7g+ZfkSDkfpt6lj13hZIek3gTaJj2bOWATz4rJmQjeRAJC1hzpc
	 oIUTPCCLqMS6bzJfdLlieN9ISU1Gv+IUeID9DTAZVLxj5kYP1Qr0La655her9/tfdN
	 OBWfOWsLbVg/lNfhVdnDlrGjbSeGoRjgPllZwzl1VwvkysLJAMK5rq3Fyc3qiwf7bW
	 penqdwfT8EZWoSOtSJqYYV4OsNDXJIXlvo2maRRt0EynkA6yFHXTqo+0tpyAibG4qW
	 uSc4Es1zIy2kLjgcyFJnCJo/pEXnqgusGuGik0WM+5cFZ4WlXGTJS34z1EndIhl/aY
	 kNv1XCWxfsxxg==
From: netdev-bot+sinfo@kernel.org
To: Meghana Malladi <m-malladi@ti.com>
Cc: diogo.ivo@siemens.com, haokexin@gmail.com, philippe.schenker@impulsing.ch,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 danishanwar@ti.com
Subject: Re: [PATCH net v3 RESEND 0/3] Fix switch mode for offload and
 non-offload cases
Date: Thu, 12 Nov 2026 10:26:11 +0000
Message-ID: <179447917161.2168702.9362989758229772511@kernel.org>
In-Reply-To: <20261112102140.2744508-1-m-malladi@ti.com>
References: <20261112102140.2744508-1-m-malladi@ti.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

