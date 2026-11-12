Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B0606A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UYEyzRz4;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=h6epGYND;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E1F13uXq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=; b=UYEyzRz4Y4Sjrq
	PF0Ljfy1lca2/u4ssipkrLAHqN5YbmabRytAgacTli5o0l3a4dS5FG6txbFR1LzB+FdhbQj4JHG0x
	DMCSC8b6ahGthyWd741O9uucOAk59/oKXsO70kYehyxab3TXAJq95oaf/pkhLy2pdrs+GzpYmInas
	wCUJM80G/pg2mJUD8Zb4eNkW+BC+3eX8nf4m+iy0cZVzk/t0IO0KTqh2svQh/7MSEDXFkUAKLJttS
	m13g3qBKQ8C6fRsNpbjeB7/UEE4ld/fdBCOewMmBx6VzbCQKrh/VjLx+HQGfw8mgd8UDThh9rbtB7
	e+jMsDyPsGYRqkribnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVQ2-0000000ABE0-11ZH;
	Thu, 12 Nov 2026 14:04:50 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVPz-0000000ABCw-2oVi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:04:49 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 43E867A00C3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:04:46 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492281;
	 x=1794578681; bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=; b=
	h6epGYNDiXOZ0U54jmhcFmhr9liTv0S3e/4nsnTQfdZmBFJGFRaPsxgpJKPUpAk1
	man4juZ+v7SfR72SVe3i5cfcS0G7NL3QkvZTt+0piUTA2wTEghZ7hXd9p0RBPABG
	5vhk1MBr3ULBoO0fTV4xpy4d/uBlLl/WFzoCs379XjgTDVtHfTWujuvdYu9H5pow
	2mXvdrxvo6BhDIXhZTTx/bO3Exp+PlvP7cK/DsGo9hy9sNUO0aoE67RezRNBDEZt
	Kasby90AUwr7/BWv+b6YVD+uqy69CBR415lbcTs4A9hLDdoP+N+5GcejR9XDXDhW
	w0ADKq6QwhGjXMVmZTHlJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492281; x=
	1794578681; bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=; b=E
	1F13uXqZUsWP9ERbcmBRauF4vI+GEx2BkuRQNzoes0ataedMZtzqTjRBbAf7LabK
	6WDlDw915yi5GTALoa6bso7Dz4Pc0J9qUX9MgVn/kt3l+Lah3AavR6rBwmaTmSf1
	/Dkgzk8DNWALFs+mQR3HrIKBuWVqz/5oa9tJ3ZgIgjiHGDvTqNr6BNpbQqqJor89
	huWf3aFIMMPKU8muFWmaNaWYC1XeD81vPT0o1Ohqq1cIEcM1xxKA2Xzx7q+SLPfa
	QKwNqZZeCSI8o3vbKYTqsjy8jI/z1G4n6JK8HUwDxqK0p+GX20y40nbDpuam5VaR
	ofEDJNS4lNkRVhiMiG7mA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492281; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:esJiGl/IgH/dy7rAy8FsQU8IBjqxVvQWyCxZyxrjR6TB+Jg
	5JUeFWmq9uP+OP+kwjsTfMc5dctSD8QuzlFgg2hYCuABufCN6hF+r0593x6g+NOM
	AJnA5HkkVJ42oLZFq9RUqe7n8zpyHq+aJROJkpSCNK9WIIPEDx9d8XM7gHMypnxt
	gUlf9/i/xaewWR/CW+gJl+arG6VfkSN9k8eyWaV65zGg/DZ43xCtu50jpptD8m/d
	xrMwn536GgMESo08oBzfngqsUm6kztF+6ZyHeuVT6/iKLLQ9PzJcBiRLVyibDTfp
	tFucFrbR6zOg10zGxJTmDCCVT7FRKdIzrDvjVRA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yhBWo2F8Mg0lXsgAAiDFBLboJONwipmeaHVibNlXcm4=:/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=;
X-ME-Sender: <xms:dcf1ap4UN1N1sYgm98NrBR9yMo43zP8zWJHt_KoCCUEsCOixwmXvbA>
    <xme:dcf1ahuPMMxteh0vrY0B4rNvmUkFDIN65y7XQAlfVmsmWslILsr3sEP7InMBsBFGj
    jbDb_lVhqrDpul3WXu1CnFH6muk8Of_T9-Lj4BHAQuKYb3qH8sFKJ4o>
X-ME-Proxy-Cause: dmFkZTEraX544mQ4uwFvdzCIHZ/nHTECZ1d9wNRCoCeA56HdTpiTyq3xSVAqiNV3X35/Z+
    dDXXwTcNSzIAJs5fwRvM3QaBeQigOW0u7sEAgv9lxlziJXvg6CryNer7nVzhQF8juyj+aa
    hRvH/YxuTpd4mrkR5o5OwzbwL4nDwtcuGyVhfjrnAyzbXG69muhVoQHXlcEoD8wQmkGr28
    VnetKWGF/1sn1HHrJB+F7J5TcmgHftJ59BVNmRvt+ttOpu2zJ8WeAveF1srqK9/1pU1bv9
    kQRD8+Jeqc9KbjeuF/GwuTL1cm0gvom1BFAQUMXqfIfM0hlgHFgzSKueKw1YJR40jKF1Kv
    1gxoiF0Xcg0X8YKBTOnVVdwZbEx7LTkcAo9TDrv5CmdIwZlhYabltHnf1TXjhEhFJ7mRh9
    CsavwvhJzZQje+YI9kWh/F4c3Byqi+Lh9cZ94FgydIu4K98FIU4bAF8yVVBQpwEVNFNrcV
    /Y8BolSDQx3UwXNXakz2fAlRJjSjz7Bcqoa/DazJqLfFkM9i0bZDaW55ekxupA1FzMDwsX
    2fYIe3mnx8s7qWJWF4kH37tOLKz6HQ9xmLTk66yk1/H2bO8Wqfi47UDgWnfhstGrZNWee4
    lE+sM2ptnn48DlRfenKAM500y06BMwBdjQDEM2nKvqkQ7fX1p3NjqkZSZqcQ
X-ME-Proxy: <xmx:d8f1anI4GyahBTQZsMiQINwhNdinl3W9pXUuBsnor0nDZiOGnXqGHA>
    <xmx:d8f1arzkSPTEAgh1hwjM-z_KEXo1JI1bT0cQNqGONl2t3IaIjdm0hA>
    <xmx:d8f1aq0bbLxprs1Ax6j_YjKbqVlZDjcm0WcWdgsV6Z2ubsV4AScf_Q>
    <xmx:d8f1ak9BDP92Kq051cUj7-aWz23-e42FFO7yN9MbetviFDBx2VwM2g>
    <xmx:ecf1aqEH4wnb05YC4zON_rcfe3sxx7jDz8fsDVXV3sknS5Vvne6Dwq7a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2DC8932A009E; Thu, 12 Nov 2026 09:04:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtwnaRLwEjKw
Date: Thu, 12 Nov 2026 15:04:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <b580eaab-100f-4375-a8df-7d1f4c751cbc@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 13/15] syscalls: Avoid matching substrings in the ABI parsing
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_060447_752578_ADCB89D6 
X-CRM114-Status: UNSURE (   9.13  )
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
> Currently, the abi parsing for grep will match substrings. For instanc=
e, an
> ABI called `abc` will match also the ABI called `abcde`. Use the space
> limiter to match a complete word and avoid matching substrings.
>
> While here, add a true command in the end of grep command to avoid the
> script exiting earlier and being able to do the cleanup.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

