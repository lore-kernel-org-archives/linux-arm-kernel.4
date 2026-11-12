Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860FF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o2i42EtB;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Xh+h1wSV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FqEKdWwe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=; b=o2i42EtBqhmcy4
	TYtB2or4dacjLeqnvHyb3RHL/euPsp2s0kIMZ3ulzQUv99odgJSbCh/zwZOjucYA2xqK2La7JiXMh
	1lNfB09BEnssuPfwNWF8f2wwn6f8Vu+pVWZDDXcja1Fycy4rfgZ3vAEyXa2RIenvyO9xU839xLuxB
	aeUHw8MdzFCqQeqIkq/hiuTIfzLSExLnNFQep8Dpo0Pn/L+eAgSPxSDvEwQXrF89AblOjQtAbHKWu
	Az93XLBBn+j/bAZgJoZmhrL7KbwL8SPdlWyFVlnRH/PBpjqsfgOx7MmPBed3V/SHx83X7vaasY0Pl
	vuZNyHxLGFLT1bZ/zN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVQh-0000000ABQ9-1eFu;
	Thu, 12 Nov 2026 14:05:31 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVQf-0000000ABPe-3Wp5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:05:30 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0DDF17A00F1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:05:28 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492325;
	 x=1794578725; bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=; b=
	Xh+h1wSVBu44nSJ74HnYBVZC3D0EBf1F6f0FHS7sToQviRCNenAi+z0CBn0Jwnox
	ejnFqzYKhIx51SNCnaUSnZzzqrQ+wqvQckDK/fMjWzFOO2enBez9pGWqHZf9eS79
	7TqHB9QdwSNlpvFDqzH0SPMAmX3a3kSolXe6DKs+ij1SwIupxzQzK+bPO+p5fSpZ
	YEtrA07xt/Q5H+cyOb/m8WWQXhqCvZtYZBN5r0VTNpsWfLsx5KSYwLH1gPTz8wh7
	aAqiDcYOqUbLfnb6FUeX3j1uLR6qs97kX1JsfW1YijTycwg1n8uBYQy+YQQIx/rG
	6nqV9Rtub99HBhD3dooiXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492325; x=
	1794578725; bh=pko6mRCMfp9Cyyy/gAoWpwIveNBcnJXIKlKgVug+D/o=; b=F
	qEKdWweWYKGwAOqEQHtslqgHkl02o+VAPHTV+Ok0UxkqW/umCZK0USiDkcQGDmnm
	zPqB668MutngAEMB6/B4Zt3OVm3JGZi4AHkcmcwX4RIJEQwks++WW45H32q4p+AI
	J0HR4qb8etAY1z/DVsxOmHZ/CWUTbosqjobcqGf0CTFp5A8O1Cbr679+KBZH5Map
	oDlpoY18EPMZynyf5mjNnsHtfwDhd/qStKlC7GIJ7InkQPO+N9RaeZWMt+FCvmZR
	vnaSVJrvgEMOkz1zMQrY+2SUBpg1yhVk/8oOekR4AMGm6Mw7wyoDhXo4bJvfu5pD
	tMEv9Zan5KlrwtvUv90+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492325; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:jGvYy7NLNNv4XCOVQ/S+9wX2vxj3YULGnsxUg+lLV2aYlkJ
	hD6pa6i6DqkVuXJZxvbX5/Vf9OnnDWGWZ+ANyoBWA7EQt7OMgIUbEbWxZGdiwWQF
	9X0rR1Fz2bd4norcL6pVrV6VCJVMD2z6CIfLlYwB82USF+YHts+WCRmQdBNU3Cy9
	glFyQjPiB+byH5+MBMSaLPuyui3b9er/dD3atet5FcQTKfnm1OhNockADUUunHm1
	nj0AzADSt2ipChNB5TWVyVqtAFXLkiJgV1iMOx9YyalSosstetowG36Nqoug4iyO
	5+3J9siBy4jF7wo20RO51KPpci/fDBJsvP1787A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:V60JOROyj/FCtqcbRKRyHTpWddfUd3jbk7dyOJsukjU=:Of2aUQiysyEawKxf7qyisIhQXXg6zSM4x99cDBoHPUk=;
X-ME-Sender: <xms:oMf1agFOMxhRnSVLuDUoykP5UcEaUmqTFjlXdqyO2uB6F9su6yRNUw>
    <xme:oMf1akLwZwhweZnV5ZmnIfs10GzsHsK22-pTYnrYX3V-cjegvJPl_Myftn5u0Gbwm
    DaCWXLR_MoNxjIEU4nSmSLZrTGV1f3nnW3z6kcicXNxfBcD27jZuRoh>
X-ME-Proxy-Cause: dmFkZTEo6VaWdj6bxILRHhv5G1jOW57ujTVJlC60OvW6f6oZAOkjAhJfLyfQ49u3ydRqSD
    6McsbenddWiSAoIlBf0W+NIryEOud74ndQRz1ZNlMraGhXPv+PXtGwEWkyMxloBFs28AM+
    VC192GnF3PbfCLd/7+bSFeIt/B0QBaOAfOsIn395cK3dTopXenIvBp6SQsQKB6phN+B9N8
    64zvJ/tH5yyX1gC6DuvHI/QxWEKFFTCz3bKka6l9Oc60EMdBZdJIR7mDAcEwPZSfBGmwPb
    2Z9OY6PpxO64z/9vBGotM7b8//4i1p4MJhV0SzERiXc9YegNJHS2YEhsW2FEyw/g3Y3ZRu
    oYdobkUaJL2vVkuf3T68WqVhzELvAAGfVl1I02wG2/C2ee5pG4BsL99/ufnRR/RMRJfUDL
    IAOiMCCS/0lXXQL0QiDC+S9LQxR0GnnllNps6HKEOYOzABoYBb73irVKV+/FvcBrj/lZlt
    KNgU5rRvLdeTEsl5/OmCVzut8/pJmcfBWSq9jgtDWtKtfbYVKtPBr6tYGiNLXE4KYwDsCX
    TuSkgz3NcCJjmEocAeYLBdE3MtcNWb4/YseBTWzbPMmhrXkYZPYwSVkCpchNqNRuriNhqE
    AZrpEdcFFaE1gBWBqfwXUzpCNEzsnW4FNez5rGN8yS7XzeIux+zwtk8TNIAA
X-ME-Proxy: <xmx:osf1avEZfAfXrF6erZ-8PXAN54m2ulAyFtO0FYzjsf_1FxrnbaIiCQ>
    <xmx:osf1as8BNfiWFYPBCaJ86GPB2RJe4q470hV-HuChed5yBLL21RKeRQ>
    <xmx:osf1asSOl9G_RlHWFW4hJcVJeg1HfYqN5torsMoo160Yk7Co8S1WEQ>
    <xmx:osf1ahrsJhcpjQbCC8-euvDiMkYTBNRXBWR9bHNczCu6x11eef6VMw>
    <xmx:pcf1ashlANfxc3dlsCHW7RA00z0RWpZW_h8YKAmt-y_S0kOrMRqVWIb4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8FB1332A0099; Thu, 12 Nov 2026 09:05:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A6ErS7mxpCYw
Date: Thu, 12 Nov 2026 15:05:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <b728a698-bac7-4cfb-9eba-505f955148eb@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-1-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-1-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 01/15] syscalls: Make --abis parsing more robust
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_060529_927164_1D1CADE6 
X-CRM114-Status: UNSURE (   9.46  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> Some archs Makefile have something like this as the rule for making the
> syscall files:
>
>   cmd_systbl =3D $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@
>
> The $* symbol is evaluated to the variable found at $(uapi)/unistd-%.h,
> where % is 32 or 64, resulting in e.g. `--abis common,32`. Sometimes t=
he
> rule for the file won't have a %, resulting in a trailing comma e.g.
> `--abis common,`.
>
> Currently this input is transformed into (common|). This is problematic
> because grep will then match any ABI because of the trailing `|`. Make=
 the
> syscalls scripts more robust by removing any trailing comma.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

