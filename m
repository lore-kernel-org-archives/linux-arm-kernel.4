Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC10606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwJbli+0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERJ79tP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=; b=VwJbli+0f3ohOORviwUF6NjJb3
	vNPtNfFpd9KXtmaBgebi9GizIz5oln0Fg/JHgF1HU4ikD6RrdsKWRgapLeNRoAX2tmYh2OPzPLb7F
	JvR5b4DvKJQPYHiktj+bJJb1Qa973KkuoMBB2GgFrSf51NocXZrbeBrpGNUM6Ph49J51semVrxpKd
	1tXzjTm4i7tXIfLB1Xr39RjbXHb/WNfkHIqnSwDn6mkCCbVn484pZlugYTfQAxubOakT02VHZgn2y
	5DyAS7GxGyUHZ0n0ZWCcN+fRkNnfymM7E54ov4tYqDbhOM21AXIlTrlewDdBDJJ/N04bgwghWFCFm
	ahI4sQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIep-0000000B8o7-3bvc;
	Wed, 25 Nov 2026 19:27:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIeo-0000000B8nL-1WKx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:27:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22BEE418F3;
	Wed, 25 Nov 2026 19:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C231F000D0;
	Wed, 25 Nov 2026 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634873;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SERJ79tP5g07W+n5+0WnXnUcHiRFiBFuuSZo28ea7dfOo43kYMdg5p3xmCDbgK3dd
	 jZacsV4RvnuJyhlaR4I5BqFlLwymQr08mJVYeL2jdg+4ACoOJKnnQwuOiDE4RmUNA3
	 jBAa4l3CKhuAlI+5h7N8Gr6XXHeXVNK9HbIYaA4B0S726xQe7pz+M+QTACrrio1UbM
	 vj+jaRw7Y/qBSHjdCGnh2eHVCNuMj1xpajQ13M37PD88gnPlNizqjiF3jTmT8KY3h7
	 nC4/9icD2EIx58RZil9eM+oRsmrdO0WjW6/RDTOBhIOvcFNmKyBoydsoYQ2E4NSVNF
	 iPzt/n/3512dw==
From: netdev-bot+sinfo@kernel.org
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
 hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com
Subject: Re: [PATCH net] net: stmmac: xgmac: fix RX split header length on
 multi-descriptor frames
Date: Wed, 25 Nov 2026 19:27:52 +0000
Message-ID: <179563487252.3294.9801787654778788859@kernel.org>
In-Reply-To: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
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
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

