Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A4606B569
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aKlqw3RX;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=N0YpG+6V;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ov0C+g5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=; b=aKlqw3RX3z5SHW
	YVA+Cg/LWzfGOOQRsbrfarS4tZO3qxfr7RMZyFVGN2BJoaoSI1aQGhoCWbyl6er0wq+eaMU3zYy8O
	e9B2PDYdaSC2gl50UHudIdhJaSvLpMX8rkUZwX+Ta6INHk71xxhptz/irsbN3xaIta0VnGPmze79O
	gVX4j5JLdGbtB439+lQ3kTKSqJIFPuhAFy4sdUrN/YRfSpPHgOklG9Xd2s3vRjGHdOyBTwxg35VVw
	9nV20bVZyLO+lzNtmqKZrc5/7xwiJtt/16+9M3WCfD/XnduQTmdE7OeRwXClmdvWW9vbOmqPq5yl5
	fb9p1A8+OfbQzksRdgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKN-0000000CwlA-1NDo;
	Fri, 13 Nov 2026 13:28:27 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrK5-0000000CwYb-297J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:28:12 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 85820140010E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:28:07 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 08:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794576482;
	 x=1794662882; bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=; b=
	N0YpG+6VotxmnaMHi3/JC2VdweYEB7M8XRDkaof1NUGOOcd0ZBtmR9r/lMmcYckv
	EOcvdPvz2o3IaVYaMO3UffHmetwLHTJ0/3zxtjhEQd5VOdayFxW7UIrUl/pxJNKd
	4kdMs3Jz83wfA/zXnSoxeXAUPq1WyxtvKHIO9qXFJyC36EUUc65djl4ts8Ivz85H
	u8UII1h0IdXQ12zdPLCnAQmAde50Da7Udy9ijunLM57mxGQzxKxhIpjWznZOZA98
	87w2sRKcK3nYCP9x5vxmWKyuWJ1X8G1RpuLB9N4rushPYrIItGdsfDK/CdWIu7an
	VxxuUBie12c6guR2UrRnvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794576482; x=
	1794662882; bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=; b=O
	v0C+g5qI9tqFVe2d85pPGKqA+YvASu2BW8zrxQKSSqQg13rvrpm/2QZNtgQe2OM9
	g2EfTzMrDzcZjjkyd7gSjpYA/0LBhZmezlnCI2vxI3EYhE45NbG3LIBWMqVU/iVP
	6JiBhtl6gHglEpqIMgGRtMffnrTbdsP6VMpglQMXLWmf45DuAW4NfrNB6TbXvrrH
	B11c4W79p65GZdDuB/PrluWyuQfZAUUu84klK530xk3aXBqqN7SbP/f7/lUTkoAC
	GzRlSVJjJKcXLnzXJQQPTbGT0A01XL1PvmBSdNF8d3htGwV+NERn0eyC59qvetI3
	J7rQuIqDwG3GO1vl3dr9Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794576482; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:DczAUIc0iqgSfyWicN/Pb79nopOFvtar99FkzjOd4kZkvpl
	wUi9yf4Amc7JXDvc9E+xxVJfFTqCLIFVdiMc8FcnM521c72WEianApsBkL8rqsj6
	0wD+zAK7phhnZi0BHFW3+MFaeYTH1ku5PCiIzi6hHfVerDSWSRoG2UBhJlNorTMB
	vVxqR8/CX6uY2pI3D/06A/BHiqIxZcFACUt9gXCaB2/D5VtcbPIkt3yA+sBx1GQb
	gQ0k69zPQnQbtAbBZcRU0+7cfXGCUgix7MJHeLgMhtc385OeVXNu7hpihuJj0u1J
	V7kJfhZCd3JpvmuiGv9KnDYdQEp0bjo9M+raPhg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+RjTD/Q6NsCEgZiZA8pRig93q5sJxLp5l6HZSEV+DLA=:O/OcHSU8JkRF9PSdP1ksG6mZ2UARTkzPpJRFqU1qOjI=;
X-ME-Sender: <xms:WhD3auR40-FcGgLStJFAEfcRvrMX8H0mvFM410_VV1FS_ePeLU19Tg>
    <xme:WhD3aukkZitBMSw0JDPCHF2enaff40UalIqHetZytUZZoz0QwbSiM6fvxx0JiQ9ex
    Hyc7pInqRfaKe6cOLxuInmZ24kvcCI314Al9tWrn7W61VyduTfYvOtK>
X-ME-Proxy-Cause: dmFkZTEFJNUm4FXXB3dty2rNQcE/EDDYqXdEkDcBe16pFUwLRr8Gp2x7ZSZu7gpf0p9f3Y
    4d3ODBGKp/oGuX3xSeKhp3H+liRpNaxKLVbDIUNvU0I8zLx5fVOuQww3Hz2rhgRfM84oAQ
    8k9XMWFDehywM8dzGAaWn0vmtnRDaTStO47BqZE5YhQVXiLdlnIY690QOItxDwiBdv9MMU
    Z7UBxInI0ppBw6Hzow2yH3bF1UoA8At/iSCZ/JZhU5L9ecn3HGyThco2v/BekIAmvRmWJn
    nqjGEapPHQzjNwlOabfCBHeMGt0FdoKp8KmgOym8Z5y0YmImYFgOmkdj7tnXi6IxKTWRD0
    FbDPdpE4QNo6ffD4xFhSS1Xh34bByPoh6wcTCQeK3fm/52BwrTKvIEyJHoO+HeR8MyM+W0
    NyMk8FRVDuj7m/xh9ao5EA7sxN/q2x+5PRZ26NAHI/Qo7U/0iWi1x07RBjIQhu5ZVY7A6A
    6llRu3LXnxwAf2QcHbVGqiJAj83dWlPQssUKTurtC84L+XkNoEuw4KfIxLQHwoyU0H3vW8
    q7+OKIuSNeUqb4GIfWSfcB5DlxiE+KxnQrb/r8Nbe7Ocjyr7+oCMrSVg2CuiLbOshXKZWu
    eE0hF5SgnEempN0hxu1pQPY2zmLIoXsGm/rC9GYOfy4sdCJD92ElePHltaCg
X-ME-Proxy: <xmx:XRD3an1fDyF-neVerilFGd5u0Zop4xn_s-2N7L6zT8xywKb734yc0g>
    <xmx:XRD3avdB-CET59b-lFOEC3kIhpBrb1VS0j98K6ijbHfbYkv_YljGyg>
    <xmx:XRD3agY-q1NvVxBmJthtyWKnQP9znqQPX5d7i8tFfmRNv17Yxic3aA>
    <xmx:XRD3asVKYxec1BSUm6fqriuiDdr9xHzbjhrW20-xFWGhJQj7zhit-Q>
    <xmx:YhD3apEu49FoFTAFU0avFw9DZejfgIEmbd-iCLg5FOUGeyh2yVwZFjGp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6893A32A0099; Fri, 13 Nov 2026 08:27:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A1iXVo9thhaB
Date: Fri, 13 Nov 2026 14:27:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Davis" <afd@ti.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <c7d332ad-09df-42ca-a73d-2dc48ff2c245@app.fastmail.com>
In-Reply-To: <20261112214223.765100-1-afd@ti.com>
References: <20261112214223.765100-1-afd@ti.com>
Subject: Re: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052810_054903_E2CB3FC9 
X-CRM114-Status: GOOD (  14.82  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 22:42, Andrew Davis wrote:
> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
> middleman and directly select RESET_CONTROLLER, and many already do.
>
> Replace all selection of this symbol with a direct selection of
> RESET_CONTROLLER when it is not already in the selection list. In the
> latter case when RESET_CONTROLLER is also already selected we can simply
> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.

This is fine

> Some ARCHs "select" this symbol when they actually "depend on" the
> RESET_CONTROLLER framework to build, in those cases the indirect select
> could lead to broken randconfig builds. In cases when it is not needed
> for building the ARCH code, these selections can be switched to the weaker
> "imply" to allow it deselected for minimal builds without reset support.
> Additional checking will be needed to find such cases.

Please don't recommend the use of 'imply', this is rarely what you
want and everyone misunderstands what it does.

If you want to have a default, please add another symbol and use
that as the default value, such as

config ARCH_WANT_RESET_CONTROLLER
      bool



       Arnd

