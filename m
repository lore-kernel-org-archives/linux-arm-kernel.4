Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA84606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLXHJarz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SnTCwGpK;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YgRac9er;
	dkim=neutral header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O07t6f9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=GLXHJarzhkWF+g
	/ZZkOUFf1alZ3tmB5l3nTeqwvKSRoh5qhX3oRWx3W4ahL7jq1mfBo2yn6Ug+H+B+8OHbggDQ57yyk
	V1MqXT5PPdvC4O1Ko26LSK6mCUv0eS+qZDi/z6Dj9k99NoTrUWy+Zk6njhMr/SlMyXFsq+RldCy4j
	IFIWHWfYlhPv/CNFertXRBVyyXzJPhaJtrPBUiU7t4tfivjRSRCSBNOfyPJvW1noG96KDbg+Q09DK
	9AlGg88PdxZWRavFbWOInEcHn0NezLoFSf3/dhTU50WbeGGPW09O2AvDkAgEqQMh1zRYfESOdqh10
	G63szTrhEE/DJNkPlELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7nY-00000008wh9-08PW;
	Wed, 25 Nov 2026 07:52:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7nW-00000008wh2-3DkV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 07:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=SnTCwGpKScWyuEWt4MeJ7HyYXy
	Oh50uiii/z90gQfP2LkvxxNbd6rUEqQuWX7CURgiMJt98ehs9rbjDh0T7r3bRxEIwqlM1vOfkzW5P
	LfBAj5fKEqBH1QA8NWJCF9E7ua5YvGWqD5VYMvMTdTP+F95SaMIWhd2n6UcZ6WaIz5PLoSSCM34dJ
	cVtPAWtCVw2bxBQLNOihAjHeA11D4HeADw9u4NmckKiqkaG/jt1Ojv5+RiIgeJnmWplajixyPVmdv
	wtyyLRcpdBRWnTs2f0gTwB6NYYjKp5j6Te8WudcD0l+nnbDSWN2tWqdn69yWEL9ySc0V24f2e77Cs
	XM6XMxQw==;
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7nT-000000050kG-0fBd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:52:09 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 89D9614002DE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:52:04 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795593122;
	 x=1795679522; bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=
	YgRac9erSiU61TQkYI1ioth44/P9sRSYS/JW/avtEZH6YizQVW6zqmb6qgIoKqWS
	FUUwRKJbq0dQjI89eEmi2pSqwB1ev0dPtd/7ipWWkV4Hv+GgXcBD3ySkEY67BJzM
	PjQFocAes++UO3gJxE5Roe8e5iGiFRuWCVnByrCCzoNTM+bS5mwt99bNGbKYT1Bl
	WU8WLAqcWCQx2nuo8Fr4tIBf3B5BUDyKXzvrRMr77gW7Ny/mLbK3cXMOEmTaW+Qx
	fRlfI2NrD0Y++hRymdi6fCrHL9/32syp9/AHXRj42gpSOnid5iDwRKXUynVd1JiW
	mNgp6movnOu0e5DarJtrlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795593122; x=
	1795679522; bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=O
	07t6f9GUgtUCqNna1FBptHE2tdnqLC72ZE/7S59RNyRJtM0FQRUZwPPBjlOvSSyZ
	eqqICSgD2eJ13lJYQgbdL0AmeAN5CqFiUPjwWEDPDeUQKtJjVfBCD6NzPyRF6Y9E
	JxUHxxwlqfdq5kGuyrQHN2VpVB0YCJR0/Wh2J6m5DAZd6kJJ5tc9uLLKHoNE8jmb
	bY2ndqTIo5U6YakL6aCDtK9ef6sp+8gL8nzo10ywa+B/xgSmUyifziVM4PPRNHnN
	ictv367qm1k9TrVYxjbWDHTQ16+hlL24ntoc0znlmZGu/WHzcJ5NbZA6ocpTihB/
	vF28GV5YJP5dULrO5q/QQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795593122; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:JhbsoQxtGXhQWunLgEEOlA4dEc19kX6GyF5c6Rm2PbIlwq5
	qxZkrCWoaZtKCI44G+gbydufzLc1eyct1IoMBdp5XVi+w8u6WvOgmzaMiduDYePY
	pk4I9ztI+RwuGdQdfk+IyF2MEwv7IMxdoH8wkjnuCQuDJap5Mgu8YE2t40P3SxU7
	U6eq5YLGT6KR6W651gxJcUE0EXzujIYNgFRfpH26pTSrBao/i69c0wmmMRQFMl6s
	+QO4u2k/emfpqt+zobQPDXMsx7aSI4Rk/pBfJqF56EkD3pS/jLOR0690G0XIm6hu
	3mn031L0AhtUeBVmXqIMf2FhrHtM9xT88chr6ZQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aSFAEiZCTpRiW+Wu1woG8Vz1ZQwpvzDxc2eGNqTlgrY=:vpzV28ZJxRuQUL4xVOIgcB5rr6QBx9o4DSwGH3trdVo=;
X-ME-Sender: <xms:n5MGa_its0_6WpEfVmkP8nUkELi5X7lOCVEVLb-9RvGIjtXW_BvPWA>
    <xme:n5MGa222_Kl_p6ZWq5DFXxZ1olzbryv-uHQyHqqEiQzJYBC1Z6Ybgkwr6LtF5a9sD
    0SEDnF38i8cV26a2Czauhu3Zn_M3j_TI97drGA9qgOTAOHC18AagMAC>
X-ME-Proxy-Cause: dmFkZTEZGMjBJZt1uWfkWP6nvt4pWCnopsg+g8jDAdQavJeS2L2MwltpTlwNaEd8djtHKn
    EPizddLB0fSbdLPaJXfL7ISnFQ1pA7d3q5xXjlkKF7Llg1RwP63kPcq0bI3SJaaGtsYfUM
    gGjOAMhxF1D//iqBwYraoqBzGajUVgZp3yCUIaTksE5UyL9pMmgUcyHL3LqjZ21dra+EFI
    TAy0zbgO0K7vfZ8Hct71arlCzW4J/YEmPJ6Dnl95xYkw0QhXDSpkudPc5Y9VXyic7+9pAN
    ximDmVNWXRqAzamP6dwkNrFM7nu1F9pqX22e3CFb5mk+WWWg3//eiPy7g2RkhevTNwQUia
    85KxHy17Q9kE3c0+N0DVqR64pqIBOD3atDXgk9TbJ+i01Nap+C/J1N006rWkFj9IE3Lju1
    fTSX8tEu7+kpTO5vuH98xqQ0egpd7CvdzszNDX3e9OVABgEBb7IxZEzDVYIxm6LlbrmDBQ
    GeEOjj4/Bm70q9bfMm56k88nZv5Q350CNnIE3eOHbHrL+7ShQVVzwMg7HXBs1fv1INguEw
    tqsrDwly4idlE5qP1w/PsAaePb3xdDGuqqurHaelJ0sfjyCcXsDbzmVpH9tfQPezIrkCo2
    W4Axz5JTf8+nRZ9HOEPtPANb9047WcwGN1oHwpchW1Bo17ShzqHqWvqPvtTQ
X-ME-Proxy: <xmx:oJMGa53x4IFkgjCIN5aU2Y9IKKjuCVKzWVl__moxFdRA-MkUCCzcZw>
    <xmx:oJMGa6ELf73cxEYdK1hIxGRzKxy3lACevEvI6mchurc13tFj1dXP7w>
    <xmx:oJMGawgoNVKqvEJOmvssjpIObYUWCcCRRw2PhFMjcVxahJ4kK2DJvw>
    <xmx:oJMGa1A5sXqUNQxIW1-zqq-kZZ6W5jCV_rFV7bRMqTw3_ev1j5D64Q>
    <xmx:opMGa-Klzxrw27CydToupd8Jqjm7Xmi2dpSG3veRuZmk557St_3kgZ2o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4314F32A009C; Wed, 25 Nov 2026 02:51:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AdoFu5rB1Sng
Date: Wed, 25 Nov 2026 08:51:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <92686f21-9c49-4cdd-ba39-25c163fa3183@app.fastmail.com>
In-Reply-To: <20261125025650.1159785-1-brad@sim.vu>
References: <20261125025650.1159785-1-brad@sim.vu>
Subject: Re: [PATCH] ARM: xip: end _etext before the read-only data
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_075207_509552_D0E70BA2 
X-CRM114-Status: GOOD (  16.92  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026, at 03:56, Brad Hawthorne wrote:
> The XIP linker script sets _etext after the read-only data, while
> vmlinux.lds.S sets it at the end of the text. Hardened usercopy
> refuses any copy to user space from _stext to _etext, so with
> XIP_KERNEL=y and HARDENED_USERCOPY=y, copying a const string from
> .rodata to user space ends in BUG(). The first readdir() of /dev is
> enough:
>
>   usercopy: Kernel memory exposure attempt detected from kernel text 
> (offset 2955300, size 1)!
>    __check_object_size from filldir+0xd6/0xfc
>    filldir from dir_emit_dots+0x34/0x80
>
> Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> _etext in vmlinux.lds.S for the same reason; the XIP script was
> missed. Set _etext at the end of the text there too.
>
> Tested under QEMU (mps2-an385) and on an RP2350 board, both XIP: the
> BUG is gone and directories list normally.
>
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the cause of the usercopy report, wrote the fix
> and this changelog, and ran the QEMU and board tests; I reviewed the
> reasoning and the test results.
>
> Fixes: dfd45b6103c9 ("ARM: uaccess: Enable hardened usercopy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

