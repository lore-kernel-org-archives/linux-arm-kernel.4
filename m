Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmHtYxXm;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Opzxc9X3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mD2qEWgT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=; b=lmHtYxXmotxG1o
	OhRPP7JidyOn7RJhxFNkTuJFCNq4B273sWMH4vGJbC9Ne9OSO6uJ0vuhESmKnkY2LkQsZBhRv37gN
	q/jV+2TdttghYqHcBh9iZh2AsGw3WdN/jnjq+WscziH01E+OokNKyrieBDHBJVphL0R7fiy/DX7h9
	iPOKVl/5RJkfkPjax0rsoNYK0gznvD7H/LG/8mdyJL1ioGDMWyCUgA0IzZ1mSj5iIakJOCbSOBDV+
	mYuqhSaitok6E5ZEgMRprzjj+VXL19LTLjV4rJRWS6SRwZeDJNrb78PGM2B/giPOCc7YyZrSkgVxY
	U3he02AtgLZiLoNgnTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA77-000000074Ma-3H30;
	Wed, 11 Nov 2026 15:19:53 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA74-000000074MF-1bTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:19:52 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 2CB90EC067E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:19:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 10:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794410386;
	 x=1794496786; bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=; b=
	Opzxc9X3Iv5LUK7NKFrkO4drKQUVNWWuVNNM6BNw4kx6ecjzwMg3ER70iCmcP3ZL
	UBv34gVvddN7a9WbufICSn5KbQtnug9W4gzxi7CYBKLlGNACVLvWr5EH9FfxUKj8
	b8WbJd0raO6UCbt4gDRIvGI9YLj/0TGwwM983CYy3XAnJQuKvShLRaUqfYBnaqFJ
	FCCyjcwnIt4OVJGZtshgnF411iALesA4q25FBwww3gwAad2+dOlaWCcFYClZFPwy
	fw3CtulUIfsWegO+aL/CWQuxnQWS2lCQCc6BfyOUP+/joRHzt7fzTwNx6jfibmQC
	FR/ANfKR5O/6Mazcnzzw/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794410386; x=
	1794496786; bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=; b=m
	D2qEWgTuJHhyM26w7zeRxiHME+zhgDZjiDaHpVFR+9+4cIt/K/9AWQJfJnhfSmiZ
	6E1Pw/MNW8arRpuTbdgLamsj3Uupbs5eAi8K+s6amW33r317D8wLd+DKfQGeUROo
	0dfYcG7k942blUYy08oFvEJBBpv3m9u1W0HQS5/aPwwLr6W3uu7lLhWUa0oWQ0ct
	GXMk+8GPid0+ZAdo/DHUPfM/QpSPxGPFIj/UG9bQusrSJRgY5Zvz1YWlG7K1xQzy
	3FfMnZTW/xKFzFW4ZJjZykdSHZ7Cf+M9OWRHVJMO3gcjFOl7mwJS+IXVVLckcPwf
	fYtgj3M1aI8SbUIagEPkw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794410386; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:gMVO4E5G/Q5yX/bidUlICn3jzXdpDImOgTHMImHHM0N+Yza
	zpX3Q1OXmWhOrlCzqwpC6P4GzcTYb/EOxTEoFAEZ/PwejjFpDjM02eFzFyDwJhab
	8A0FI4tZ3QAzoGUJ29bGQAkPOv74M9zgE37k7NXzI6gqOe5xejnDJOLPqfEgQ9WE
	7cPhfg5ag5PS4ekg4FHLdOJgr+p6P/FqNTlGOrN+Dw18tDDQqyz95NobA+Ztm8LK
	zqQr3xQRBS0fhaXZttOShEDd9Cxn4CwpQBV2l/9sAmbM0ghIUkHGWfSin7YsI7Cd
	d70viWWUMTgFH1rBrMzV+opztzxfelqR15WYzPw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XPsa+xg3+P9nThBkm9l6+0YEEti/hzum0Mf8msDw0C4=:ObWjAgat4GouzXMeDmlLqqN7ns2vk9BiVvcOBSOv/2s=;
X-ME-Sender: <xms:jof0amI3CS512952q99s7UiU59-GWES_oSJlq7z-cg_IHEntCkwQhg>
    <xme:jof0ao90lcd1FaMBuXyvytvqfASQW0juqPIlQqmgT6qcwVvR_05ESU-L3dDFVD8_r
    sMvYC7qSD2Gb3pKeW89rKFnvbdMEAjCkPx2GfQjl7C5ZOASEZiTAA>
X-ME-Proxy-Cause: dmFkZTGYiwOSwtquZw1u3N1npgk1JyeolpYqhMJ/fjE+ISkmbdJaZbeQGaUySSR36PWQWp
    94oZq6UlR6YWBTVFxDA31nwK4Q18KuH58ddrcwFvDz9U8b3DrvXKFi6gAKqC6wNJNKWO6k
    giQ3WIQ+R/H3B65yMLDHkRhuw2p51YOKNbfxQ0xN3vsBTTJyEJmRk1M0cnAPu1gocKw1nF
    fBqfdFs1K9BVhGexEZDB3LAV/BhwsY1I7560w8VYGHdvYjSXeVyN5oQ9BPYFtateyMiHft
    UynM1pydQ7v9dvBM66i8GYiUa8KBEJGfYi3oKPAe9ML8rlUGY7wpbI72SjeXptbKmOxnFI
    Hd217rcR+ufKbSDe2tX6iAy/f+grzTWay+lnZJszCwPpP1izCJDcbsoGGoHpii695BxYEg
    ArK+pZbx5GMO41lcKhXsiVhMqXmQS7HAeHVqsKIDCyOBFPnFvIibYELPR9i1d3qiClX+iV
    i7v1Dy9ME0zPkExYKTf7IEidn0rKuoxOHB4tnl5Vv4zYlDQSmqudJurjPyqY7D5XwTi064
    gMBjIE3+gGjC5/6Xh+JpGFMOjnv+4E4iZ4p08Nj/eEnlCtSb3oRsadxMlqsCKVwG6LHnq2
    2JXamHZQa8hv52n5QvYv1+mHYTdc21S5IM7DFIBxlCXqW1DQ0x2HMPQH5tsA
X-ME-Proxy: <xmx:kIf0atNxLf1oPHtuxZg-ulymHbQgyR90M1piCGxbE3H8lML_rGFBjw>
    <xmx:kIf0avADiheYRUETX3-YrGjJwLGY-TwwNjjbK8kYlM9dtDbbJ2Ushg>
    <xmx:kIf0aicLGlrDxudzhUdQMA7cIzDg7I95PW8spbzhmLHIokbqVOYOug>
    <xmx:kIf0amPn-FEwHA8qJn4hCWhNpYw_7ttsht6b0yYXqU--fyV-vvk_cw>
    <xmx:kof0agKarChKwFvbWkB7QoehN3XDHRjbA6QMe8GJ9ePDkt2Pj9SvW60o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 85ABA32A0097; Wed, 11 Nov 2026 10:19:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Arg9H_lZnKn7
Date: Wed, 11 Nov 2026 16:19:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <76cfcd88-d701-4cb4-81e3-e463ff6a8f53@app.fastmail.com>
In-Reply-To: <20261111151707.2253768-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-3-isasmendi.agus@gmail.com>
 <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
 <20261111151707.2253768-1-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_071950_905526_2CDC3A3D 
X-CRM114-Status: GOOD (  10.43  )
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

On Wed, Nov 11, 2026, at 16:17, Agustin Santiago Isasmendi wrote:
> On Wed, Nov 11, 2026 at 14:56, Arnd Bergmann wrote:
>
> If you agree, v2 drops the disable path and patch 1, keeps just the
> early return, and adds a line to the binding saying so.

Sounds good to me, thanks!

If we need it the other way in the future, we can still change that then.

    Arnd

