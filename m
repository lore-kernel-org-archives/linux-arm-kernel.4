Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8511606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fstGnOqn;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BgDCCRZe;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DjNFiF/g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dl26GbVg1oiRuWqjJg2siO0OK6Jj2MIKjLQSLXLLVvI=; b=fstGnOqnK2ZvbX
	8vcJ7rvplA8t4dzgAHOJbak+RT80XAQzSnVFwk8ZrpHGBhoiobyJkDpdeJPp7mquO8AVe4MuJtHhr
	pDFJ6vbE20A0iT9Dh80OnAZqjsyk29zTPQF15Vb4yya80JvR0ZdVi494JNsK0Ydy0bo9FsJVmIeE4
	Vhyj2ma0kUK4dPHqxE1Ocu3AQB7vrgOz+rmdBv9EVEDnYCCz5kJF4m9NE6WhAYq8GjnT6QJmfpREG
	Cf91siinvBqpExU6ID3JyFuuXkYKkcAyl+AFXwmOrPH39lisaQHIdbSFQ2Rl0hnPSDZLT8LYcUFyH
	fSE3DV9gR+tcsUm1TOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVcX-0000000AE3Q-2hHP;
	Thu, 12 Nov 2026 14:17:45 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVcR-0000000AE1v-2Y7x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:17:44 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9CC4D7A00DF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:17:38 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794493054;
	 x=1794579454; bh=Dl26GbVg1oiRuWqjJg2siO0OK6Jj2MIKjLQSLXLLVvI=; b=
	BgDCCRZeMAYVP5Mkj3rC4Dx0zPfpuVx1tHrvLPUjMUiE9v4Th8qYAkXqf30BhCsD
	AbHa8yCNbVYzzKPm6VaDXRF8TdKbbwwygMupuI9lRPeiB+IDkvWyGW1D2U8LDwRJ
	REBa4iHNytvQeP2cdQ26sEhXGgegb4THLEYaB5KxSwZMGoNreZAuoETdNSs0RqW+
	WiBU9wK11SpZRjP5h3H1afBYZFpN8N8XuvWNoXcMlRxxEHVk9LCpYojqMa1Xvicg
	70gBugV2yVntrBidoQA1rZ8KpsZUR45dNhF9L3iwDGmHFtO0xoiTHXZ9m8LBSbT1
	Gj1Y3Cb1MebI7XZb6ooSiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794493054; x=
	1794579454; bh=Dl26GbVg1oiRuWqjJg2siO0OK6Jj2MIKjLQSLXLLVvI=; b=D
	jNFiF/gyldbSf72yF03RPBfvfqo3QLXXUSHA23Y6f4JFfRjITQ7MR51oKm7Y/m36
	G14pKndIrwIwIEWh4evUxSara5lSHuTGH5v3E7C529/nAlq7iy+MzsWTt7SChnvv
	wR74cJz8zTVpv0G9nWezRB/Gcx+RGnsmh16nx9Ykl9V549U9Ue1j8RaRcDb3pK9S
	cl7J1H35YxYrSWKNWiuMRiaQK2fYo4VUCev3OID0lZUb7Ganbs4EbC9Yhbx9jp97
	7RvuJGYg2tcBAzBE/9bQm9U2sOxfdscsQvcvwzCDVr/uKZPvOd53IeX+5IbT/fsi
	U8yGmb91KO2ihEzrHHKow==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794493054; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:j02oqsKRbIWL568RS+qY0TKcDH4EvwZtaLuwLxnb07Hwl5D
	qVRfiSOIfEyXgJu/bx2Lid/9TUmmFYOp8A5/xN6DhLJw4z+u7oksXZZOqJ8JjLYR
	nvCfvjrYvTwg75m17Ww1fBOkYU/NxWGiF1FdusvF+NcwGsLWAPX2eQEQ6aMQYH9p
	ya7BJUmCbbkF8BZmovMPVmom1/RSGgIEND48THOawGyoUljVUu/yWjnffHV/TSdc
	0ZyzPb9PkbWV0WVIFmdsPb8enKgQ4Q//dfhkue4jXK8Y0BAn5ufdrh+su9bhaj1d
	rtMBJdIqcCl19ZcAY7lJS7q2RVHHbUCRlYkTczA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pDEDEbEGIMSKrrCLp4vJbOtj9ftXD25ifr3Txi0ong0=:ihnDo+fn6sT3wW2JYtL6VV4KZA17ran4u86UJkWTYTg=;
X-ME-Sender: <xms:esr1auMX3thMxma8_ztiAYINB64rYZ1OoGq4Lba2qMVXHlnsLf0gBA>
    <xme:esr1anzx2JrsuiaSpQUKP6BShu4yxdXEafjZevf5iJ_PSj0AagENZIqZNG10Dcy4T
    ZPNvEMEVMcjlsml9O8C4afEUZuRbLQfVpMo61KGPNgTymIh_lFs2RhP>
X-ME-Proxy-Cause: dmFkZTFzWmoFbTkI7ku6XcdQ5hmYHvBEWKmAFPbxx+KR4fuDHIzPXuKeT0NCsMF/OpNsoS
    vNCHz4+rbPFGPxzWkj4fQ2mhyluj+KuubUvMLFtq5HTh8zcdQVazJy1ZO3KupoUgNX/HBz
    UK3ZMd78YWZnDEkDu4jfayCCjWchMJCp0hVux7BUm7FZ+xpkw2l21dm6hf65cO0zUU+UgW
    0xJ4JOUkxgcOjmsQHqWBoqOPcyOeq6m7PU2wJyINkQmiuXddixOgB6X5MZXIUgZ/6A+4gi
    /2GHdXAjLTRdlPJq5XdS+MaFOnCet398jadXoGZk8QwjUY1dNB1DztJ7N2yCV6k9hzAVt3
    YERdmi3cxnlo2u/Fr4+/jwLaSG8K06vfncSJgdAFlvJ9IZGhCtFH+SA/c0iKVjdqoj5RmA
    mv3O8ysmd1Cx9w7Iwck1JLIDnD/UEoV+lxqpTENFt8z9V1QbqGN/lRqpkoY/m6DRdJidMW
    voZZDuRV2L98fCiOLdzGJRQQTjyvEhk68t3azBy+bMrHBalh/WcEzV+mgM1qMKuxKND9aV
    vsGkexNAZg+vqQ+h/jjW6Fj5+BMvdn7a1tClce4EYlaRMGvOt7BBw9XmDobvscVt9D7sZM
    RfuxKt+2V07xyHeeQwiwbV2R0EDBQe0yXWD/ukogazvfc1OeoSWp+n1b6YgQ
X-ME-Proxy: <xmx:fcr1arvlfUZ5zY7s63oNATD2IKLwoP7oPXxeI0fDqUY_oT_MsXprtQ>
    <xmx:fcr1atFCSHPOQGOFSy0rC8QHirVbD09Ymq7u5Mr9nEfXsj3MYw9Kow>
    <xmx:fcr1ap4ICi-1ZsEaVt5Jq2HXR5jOvv8K2T4XspKXDbRfuzr58VQ9pQ>
    <xmx:fcr1auypVhvDdDON9TS-fms29QCLjYsgXsSB-RHjS1-zByWAEcyaHQ>
    <xmx:fsr1agLFJdgZsVPD-Yn31hgBLVw90wdlTHc07fX6wz_fVaKteeZn42mv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DCE5932A009C; Thu, 12 Nov 2026 09:17:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AytIAyy8u7pB
Date: Thu, 12 Nov 2026 15:17:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <cf0ce4be-43df-4341-816e-4d7f4f486beb@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-5-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-5-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 05/15] sparc: Use the common syscall table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061739_690075_3407D402 
X-CRM114-Status: GOOD (  10.13  )
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
> Remove some of the duplicated code by using the common syscall number
> table.
>
> The generated files are not exactly the same as before, but they have =
no
> functional changes:
>
>  - syscall_table_32.h would generated lines like the following
>    __SYSCALL_WITH_COMPAT(422, sys_futex, sys_futex), which is equivale=
nt to
>    __SYSCALL(422, sys_futex)
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

