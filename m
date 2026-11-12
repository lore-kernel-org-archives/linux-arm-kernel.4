Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60660A2623
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s1RVnYCD;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dbjy4+Z+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jsamXKKy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=; b=s1RVnYCDXhuVHd
	oB+ZoszXSmqkaSZp+BtrhaJbvRERGpfhQMaROoXEM2k+pqQdwO0LwBsc9BETVfBirI5VK9zzCuaSL
	+6HyVpz9DKMDGfmRVhJ8id1DilPa1O3tz3tsvqX3VpTmJzx5+mGKtKrApFS0JrkT5QwiREbcZBJTd
	7aXENQfpWLYvllw/slObdyXFclWb3O2ugz2Ws+G89FcqtN/tU6lksTnHTXqjXqrsDbRwhr5rEoMUF
	oDgYec+uP8j1D7nhWlPGTI1RTJglUBxK+19FC0tZ80Fheerd4BIboAamhWCH3kpv6fZL6wW6Z8Gpc
	82lzjKrgc3iEl5w/YEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVRh-0000000ABfH-2uvO;
	Thu, 12 Nov 2026 14:06:33 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVRf-0000000ABeW-33gi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:06:32 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A73D31D000D5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:06:30 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492386;
	 x=1794578786; bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=; b=
	dbjy4+Z+hJnfJusW9p8xSSYAEHXM0zVp+ypHcRANXar9+N2RjAIg+JldE6pUGthp
	Lvcf/Il+pN0sPVy+sxMeIf+JTov5CMU2K32yZ/91Q/G9C6rw2DxdJsg3dvCdYINe
	EZQIbjT5sgD6XZ2/0RlJvQdicjt3v/H97hdIRVlmLB+2Enpu2MAwsGFPpoSgHY3h
	U/KqHJ8Q4wyStF8q5qjnAquoxMKJSUP3plId0gsAywmBcuZe4QC2OjfVCtQlfWeg
	WckoId/GvVfsqcgNt0Mb9R3kAnXzNV4NdTHqP8PgOThH7Ok2u7Pv6iJwvu7KJGGs
	ynGZl9a+iBbiVcEBjx2Pgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492386; x=
	1794578786; bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=; b=j
	samXKKyQcrlGQtGpvUpGp+oRp4ujEWwheRFlyTS2oKjFrvqZ3OJxT8zQVo2wtSLS
	y2z2lUqhHGGDXKE4iIcBBKaVCcF1lMPae/SfaTKgolpV5+DZeNIeL2EiEwsB5HLH
	YteQ+sMl05mL6Qa0MSed67pdWOcmw8DNNuVOC9XMWEuw/WAQuv+u6ukp0fxBH8GI
	3rD8uEkVbMZ/dnaUPE1rIBadBBBHId7UKltBuZT+ikbKxQcprio7MuSLVpk6vDRc
	Yj9DsT4AwO7GP+IqZsaBHdQHfxLsvMG77YBI021VzcHYu9yE7k4H9lqZPrHCcIyS
	Ymo++NmJ9mCgfJnKZjwwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492386; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:A3z0hEbBwYR6VHM82MyzDakfqU7b/am/rY9hOIdDiS1DW/N
	3a7KBR5SEnqhO/Fy+/4BbPEZ/bkSSn7ByjJ4mNsJyPjpbY0K1PkaTQ1DvUs9cH/N
	kFaiHljzNxE6bXuJt9Rnbp7DI2gV/sxocCnXm4ngvVvGA9eM1mPmwgfl8MJoWtLA
	w3L6X49/cQGSLkqqfngbon+1MxoKFjaTmxTullCVaiIfSXL+INrYxl7LkBfmYmfH
	3Qk1IoPRb+q0uWlj0aqcVFAkMrEOmecuxcBRuRVHtMi565dw3nHQdGpbNOrjO5GN
	LQJ0Xtfgai5BTXNELaKh7HehmfgghzPlpirlqpg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TDEx+2XEDPCwv4i3FL9YSLCi5D8dWp2o3/cQgDiP8ns=:JHxY1gVMr5Yna58r7UfKvy6gRlQIWiwsrWDbIJI7G2c=;
X-ME-Sender: <xms:38f1ap_rJ_jsCsMQ41MAW2hQ3TzEVmEcFUvryDJReN1fekLFDTRq9g>
    <xme:38f1aogA03r26N-KGCidodJks_jV2i2QBQITe8K6lqxYzUtCzOaUbofdiK9mgnl9w
    4ZSp7imGgtUt91NUthq-qz5A_onLXGmHwQOGqHgoeFbSVisrMxAOq7c>
X-ME-Proxy-Cause: dmFkZTGPYkBCc9nvzgnh9CGa6gZKRI+IcEF1fg2G7Wyq7UzVQeV6zNhlYgHQfreqw2bxe9
    xQstIULovF3CK4uhQpR8cEZz7AA0ChTcc22sELOJwvqNoYuolmsRFj0T0BBjeZiEwJOfuC
    8YQUZSg/a2Pp3PAfG0BJ1TzmC3yOR/962VxYr9uTD3HHZcQj7wOtSY5EZ9rz/FmieEs2pt
    ukVFgDGlkLdaPqPT+/JFhrt3WarMufiyGKdUxGynEAYbzdq/V972kexsOQnXXscwtAYcd8
    d+KOCpTn2YnKI3/alMszUky1iaLkLaklciJetmtygaZapBAqTDBO66YloxtQj3IKN6cSTA
    MAGBcSvHE8mQzLvD1RdfnfYWV44W4zZqHFWnK46VkpMPCkZtCvdy1JS+zAdg6ODYWBgKsD
    G8sSlbHqlM7hd4t9mTGAxa1B+jPcF0JHXlo4G4Ns5UrWM79As6MJBBbDQ9pzNL5wmKmp89
    HsTHn1gVjydVG6zngECVmN2OdrumnMCfS/7D+j5FlgpCnRuWsk1vNcaAv2ujcn89BUVEfq
    aLFNbpWVHAZQkgKGXB3cfnG5iKu8XvVRhSk8NbFtdT58W6T/GXeZegPtC8Q5A4B0/fsRCc
    JckAnzZnlsR81jRCGZDPK88pufnNmWTUXHHxN6EbStsauEOutjojfgYf/PJw
X-ME-Proxy: <xmx:4cf1alh_NXAllw19P2oRA6fO455cK5nUCq3vAi2OiZ7imJsGjryqrw>
    <xmx:4cf1aqe7-r9GX8R86cK8PdYqUuBHWMw1K7V0irj7LBNAkhvArEZsOw>
    <xmx:4cf1ak1gMTN2vGrJp-SfOWzM_3j-zFtVjwOA2HoRHWTsnOzc4VECqA>
    <xmx:4cf1amr-GAxp0EUs_TeKwqgOPFj_tHkZmUeu7dDGJJqE9zrC2m2dMg>
    <xmx:4sf1agKKrF8Afl_meq1aS-zdAZZTmLJ8mGoP55xmG21a__LtfRPA2OIF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0959B32A0099; Thu, 12 Nov 2026 09:06:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgHRK7OsiQZc
Date: Thu, 12 Nov 2026 15:05:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <e993ddca-9e64-4a78-adf5-a105dd5d6254@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-2-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-2-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 02/15] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_060631_836085_8AE45C1F 
X-CRM114-Status: GOOD (  11.04  )
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
> To take advantage of the subset of syscall numbers that are guaranteed=
 to
> be shared, create a new table and adapt generation scripts to use it. =
In
> that way, every new syscall can be added to a single file.
>
> Create special ABIs in order to make the table work for different arch=
s:
>
>  - `clone3` for archs that use the common clone3 entry
>  - `__clone3` for archs that use their own special entry point
>
> Create flags for syscall Makefiles to use the common table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

