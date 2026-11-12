Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F21606A881
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H43wvPMj;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Pfgi/xpw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oz9i6IbK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yr0atXZ0m6oU194Yrrdf0AUxqB9AC9ns0Dfj3SU/vfU=; b=H43wvPMj4gZjX3
	N9YQpswsGzGwH6pExfulutl7o9QciXFC1Y3HG+S/Uq5ZbdUJy2MyW1GCg/EB9NT8ed6jIR48mi1e4
	vic7k97imX+aiR+14eHtUi6rCkqP00Mx8zhpVW6eGiuqTELXnSSS63tRhsPgX4bmNi7pe17n8z40G
	zKk0RFu17oZzKiJX4JI1uPFLXvr9tEB6N/nYy0FlhpyqjlpKd7x8ykp+DeWrDvHAH37srXd1ppZN7
	dse8s+6ZNE3tJozONXaBdJwB67pcv6gXNk1SQa7sYOg+ViY1gXAyECqY7O0eQP+XeQDejxlC94lBQ
	sVSWHhAiecfUC6tTJx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWV1-0000000APqS-21ta;
	Thu, 12 Nov 2026 15:14:03 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUy-0000000APpi-1rOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:14:02 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 3E8201D001E7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:13:59 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 10:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794496435;
	 x=1794582835; bh=yr0atXZ0m6oU194Yrrdf0AUxqB9AC9ns0Dfj3SU/vfU=; b=
	Pfgi/xpwEatfQthVxvTtNqAXrKIh0mwHmnic2aeLsrDBG8t3hY3NC4RYzy8fgSJb
	wAW/NdjoV/0YfCBNfv4G+IZjlUSKEiRzS4vkRa9U980g1dwieP1snnZhIJWSG8TI
	Bia9jZ4TCVXU4chpKvWb2yjrgl/Zok879rDtSoaJnnBfXxntf1p025ei3NX4D75/
	k6ILjz2EE1AtW8EIFHfmT6duNtFGW+wn7bSjFSRV6jNesWO5f0ezH/+OvEstkx1r
	bwExdHgmA7CwHudQfZgKpIiZ73+2ieY6hGRhXW/tIK22ghKtpWs+10JtP4S2nOGx
	G822pQceXiXSFuFKoIqYiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794496435; x=
	1794582835; bh=yr0atXZ0m6oU194Yrrdf0AUxqB9AC9ns0Dfj3SU/vfU=; b=o
	z9i6IbKnYqZoI9sWpPEtnLV/t+kGE1rqXxfRBswwGEkq2tRxXPlmkDWw8q4My5a/
	EnqVEiXfX4qcFL8Dd/8zc/DkhwTu0OcoVuphscVfbScStMtq0+jU3VoT3dXNCIK0
	0NWvMoCg2xE5HFRup9lLBxHkggZ3Z6NfiZp+ppMLYi85sCDWDuZyvM/rjKh5i9Ct
	tUuDN83BTPrd2rJIRJ5N5XQZ0j6LkhlBUd1pe2igTuQ/4KYJ4e3k8DKmexbkVegE
	Px0uQ67fHMPtrJavDz+oxQL4OQjpahOGC3jAtyowq5potpHU6UY9oeA8WjOIxzJW
	w3EmhHPxUgDV7ayQx6rrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794496435; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:luaIglg/TZrxWfyJANcyjsL/3IM5a7m/PP44m6mkKswBXgn
	LkM4iFTf1vEmKlZSMuLWvLPSy4fT7Je5rdC4acpDy4HeyD4HJZ9rntRc3INDMANv
	vvDmJlp0uOEKWbon1ADT4l0vS5xx2sJjuwKPHSorY5hnUWX3ibsH+/o4+j5vL7fC
	/wVlBWmjrhVkGhTxDJhESuDUJGsvvTe5BQfTyeZyTGITjjd8ypSQlx7UGF7wRqcG
	3GyOSXm+3Qt+sNmTmMDWy1QHTViF3UUGlB23fNnOVGukSVeFgkXfjjX+dtX8HrIM
	Ycaxd+t/8ykAqMZbR4atvH2w/1HqWUAYq53fR+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:V1Y82DRVNhyeaUYCMNFZd6V8It90rR9izI2oqRP8sZs=:qTDNJSMbhXSIYjAgbioGGC+Lc/CIZXEv1nkhrvv13rk=;
X-ME-Sender: <xms:r9f1agHvDzAKRrPYdrBZTHEKh2jVCLH1DRg4mFWOt30Q00V3mmpIIg>
    <xme:r9f1akJ9_tUbTgUxIt-Ajm4_zzXX-qr1o96ybFv7O8m-xR_pOzobZA47p7D2YSf8A
    1qAEo5v03Cek16v9zAHPZKzmdauaTZleIor8Vk5olZ4FNxEFr4B9Wg>
X-ME-Proxy-Cause: dmFkZTG1vXRcIn8fotWLJjzVfhVY+BjzjZ1qnowZOpNT/rv+EfWWS2ow7G1Onc4Rm16y5R
    PG1+D3bOroSLj+j2Vred/jg9H127leojZpubS8ufggGVB/6Hgoe+/Uv1Qj+LK7TzQEE9fn
    GbEf4kU1UIKVEsjjQ26u1CMO51m0ygZnUabeb4JqpKgwxOcfrkn1JkKVVVIgQm9G+hxaru
    cZHBkZwNXHRKmLY/AT1AxSnLbbzlPdZyTsiA2jwUcJtLEMWUHGN0RmzLffaEwCuReOzBvv
    V0DoNxTflc682GMTUPUfaiVC+PuH/fmzSt7e4TEEsDbzT2ILvNgldqw9fH+7wLIDPNnuFS
    Uz50TehBjPHbyFSYDcqjMWbpC/goN8iYSRtjaG4fiqNdRhhmp4yLwzSEfGLMjwnNH9PopE
    vrJahlsIv+oXJbB65fkFSEHeYdVueu9/mKAOT1D4DLPLYTLqc8hF8k7bFIUXSyZA2lAYIq
    RUdkugBgRWOX7JkF+sZPau2iumroWiUlTOieJYj/zqemrD6Mesh9+mk1S6YUOO9Z9fonrE
    tyI9CCpS3h5cKlwNAXTQose5L4743s6lfJrOYw2qDDmA/fkOiN8dNa4i99yiVjUJVBBWn+
    iASqgGkD128e7nh/7FymnoaXMCjO32WVukw/dsjBvpWQ35/ca0UlqIeiC+6w
X-ME-Proxy: <xmx:sdf1avFuKdv5T3dsTFH9ppTkwaxvuCrz8maXZ9iftAf7pvSsaeOUYA>
    <xmx:sdf1as8yYC-u4FVbPf-mQaqaQxwC8tcj7la1HVFZMsAsX82B1sCRNw>
    <xmx:sdf1asRrAUm7B84nxg5wuPfMFiJ2mOeByjn7sA4q3omujSg0VCLzNg>
    <xmx:sdf1ahoFyMfShoLhzNDcVFSRhAC8ZhaAXM1DxSNm3dYv5NsTLO22Bw>
    <xmx:s9f1asjyFS14B1Fed_hOIYHbZ_Hjcq0cHv3iscjg-yluFg5JykcpP0gc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3AA9232A0099; Thu, 12 Nov 2026 10:13:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXRzvbN5yUxV
Date: Thu, 12 Nov 2026 16:13:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <1bb5a117-bcc6-414c-9268-4c007d219ee5@app.fastmail.com>
In-Reply-To: <ecabf256-3dff-47dc-9e59-8f381c2df4ff@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
 <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
 <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
 <301115f6-3f1e-4e83-bc01-0ba49dec496a@app.fastmail.com>
 <ecabf256-3dff-47dc-9e59-8f381c2df4ff@igalia.com>
Subject: Re: [PATCH v9 09/15] syscalls: Add an option for offsetting the common table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071400_575647_BA18346D 
X-CRM114-Status: UNSURE (   8.61  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 16:10, Andr=C3=A9 Almeida wrote:
> Em 12/11/2026 12:08, Arnd Bergmann escreveu:
>> On Thu, Nov 12, 2026, at 15:37, Andr=C3=A9 Almeida wrote:
>>> Em 12/11/2026 11:07, Arnd Bergmann escreveu:
>>>> On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
>>> So one option does a string concat, the other option really does a s=
um
>>> operation. If I had used --offset 110, the result would be
>>>
>>> #define __NR_file_setattr (110 + 469)
>>> #define __NR_listns (110 + 470)
>>> #define __NR_rseq_slice_yield (110 + 471)
>>=20
>> I think for consistency, that would have been fine here, possibly
>> using another macro.
>>=20
>
> Something like:
>
> #define __NR_common_offset 110
>
> #define __NR_file_setattr (__NR_common_offset + 469)
>
> Sounds good?

Yes, works for me.

      Arnd

