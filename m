Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933CE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMLUcZS2;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=P3crDTR2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fSUUtdbR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pQQOtAWIajuSIjlpRm2vXAuyWpPNUiVztPgT4AugiJU=; b=dMLUcZS2ynMdwH
	ZbRZUg075SowQPABr6pc9zGMkgRT3vCVpNrjGBJg7V7cUqbjiaM8+d+aivmI+jfzFRctHIdvx7aCl
	fZrB7GjTYF9BhNn2gKmnbM1gzlGUemfK3GnyfszeQcGPvTGa69uQz97dc3aCbYir0Q3doIm9KoQp/
	vcxCBFqyiIoN+97PS3aq6+wJ3KFwDnVrBz7Zjm/ICXUzpHXJEJw3PsUxi1PagbsIcnGKvOkKcma6f
	BbX1C/HlrJGus3H6ViOFgTtXI2C4IhRF1N6x7WjWZYGuKZUmh2Darca8nx/tRtCpFcteRvCfBTF0C
	7GWx+wGPovUtMyAEzt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTpn-00000009qp0-3eAd;
	Thu, 12 Nov 2026 12:23:20 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTpj-00000009qn2-1lOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:23:19 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EB08A7A00CB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:23:13 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 07:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794486184;
	 x=1794572584; bh=pQQOtAWIajuSIjlpRm2vXAuyWpPNUiVztPgT4AugiJU=; b=
	P3crDTR2QrE3mDKXA0pzvG/J0bybuc/GE0R2+MUdZp264RpkSMcQVZUcYrDDpZgb
	IF+xz7OFlA2tZ1mPVXTCRlHno9SutFrCMpp0k51JBZDEbv0keJE4XFc7UCBBsbu1
	z5onelRGFLzhRVe4TDGTEy+caDsXmV/0vQkR9L3QcLqzqVWjjRtJV/GZsPcOQArg
	TFVocEfVeZn3ldcZG9Zw+36qsWWQweFRqkf561gT/9CziFep7xz+6ynjjfATsBE0
	dDxnnAdPXLtTWCfAR5HvCihTN1MenKC3qxdhalWsDf9cehT8iPjbkvssqTUmP8Ca
	rixYuPIXf6Edl8S85rwsgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794486184; x=
	1794572584; bh=pQQOtAWIajuSIjlpRm2vXAuyWpPNUiVztPgT4AugiJU=; b=f
	SUUtdbR4HBO45/mk5eu0YAqBeAKShi7GKHdQyo/BWkb825A8Zi9EIqwWRVSs1pcN
	2shVokvXjHddAXp7isok9lwDLIHuHWfHz6MNmkmQtn9hidGG8xcTZrxrxLs4ERmj
	nnVUzsilTXAPPOFMD/tFoVHWYowqJS6SM+jBC74dDQt6d6doMt0uaYne/4RzxYm/
	89EbxzKiZzolJ3h7lYx/Ky2Cl1+SZPPNnWFwJxKLaG7R284peEknvZBcSlslGRzw
	5132kjSPejun9DRxwYozg+HXZkI0d5PX085EOoASVy5d7xZ1sJCrtlCPdoVwB7q1
	IGZa0lXrdLbZFFX1aXggQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794486184; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:cb6rEV/YDXzANEgcD/WND5N88J1H7IshvQp1WKcSIOG/T4v
	lKIRMtTlzOr9DZtDmKWXVFVIW4MAq1cvLvNdw6KckrnkuI9ViwLKDngJOqBCj8nh
	MNKSXXYoAVBXJoGkjxSJsFL40SRqcX6G2sUctBwWLiuVLX02SdG9yScdDH3Dj8Oy
	xHatZ1mnC6AGmjimogJ1Jzn7iQjXnv1xjBfQImT/+vvO6rgtrTaribIMEPpiDRk/
	a7jXjIMT52tA7NRwDhkBU8oro2DM+bxVcprkVNhWTQYn76EM4sHEf2X5BmP+6z4i
	c7kjHGkxLqOzwseHsVsu7/WwY5O6Kk0upSW96mg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:70yQGtggowVYDRHL6YKfPxDiilpVHlWmnUJX12t/gPs=:O91qDgHCDp/h71v8TAj9HM3/MV9+IU2QNkfmjp6XH8o=;
X-ME-Sender: <xms:n6_1al4q7t8sPbNHk9ZcDabDfZWI--PS3yobCtKgM18RJUCK6pIt8Q>
    <xme:n6_1attRr8BlRCZWHT1U2n7s_V_y0dEuMhbW4yU00VZPFcT55_MhPxgRjZRP0LOYJ
    6l7M0RT8hyR_0q_RtCQItOEBMp-FqCFbVSgk_l-UUC_MGSuMH9MnC0X>
X-ME-Proxy-Cause: dmFkZTENDWCLZ1AsP1BwOxKngdvuCCtkQqE4MZA6iiupg9JFXObYdnXpxnrsIceDQ9snZR
    PmdDa3QNSvwQc2VnXG8kK3uQ1fnh26r6EfLM4tXSRfWOEQqnKY9QII707R7oHHunYlR01g
    GM8ofyASf4KacOR/q5T8wLVy3McGB/LL6qJQykGIUi+PLyL3GEZNkdC7swMBvRvdaUSHOa
    M6JzuiMhYCBPCJMgSaZEwSMVRz1tUEnOxeRtP65pSti3rsT7bpdM3lDN4Cj8hM9B2GWc3F
    gYdQn21QY9Vm2bWRWZGFAt8nRliVdU80mdPzxWLE6QfIrmj+LKKjwBinE059J3TaxrezFd
    z+ptb/+kggG/4zwdHsIjICNOsvzsn93x8woktqYPxE5S138aWckanjQhcqqD3Xz5I3QGwZ
    HyaIy4NSEFB3rZpP65nB+MFiBId3H/KnEp59m+ePZJsd888ZbLhkbYQZBeCeRGpIjbN/rN
    xFntOBhfjEJQcdR2QVwqMwq3LV//Yn2vUarjPKtXnJF8ZmzxZS26D454NlUS8+eCVnL8WG
    j1LYpBLCtx3CXLg73JmvkDA+JkFH5xFnfEXNtSuMu37pKYM8585zicLTLL57nFdGvPMTk0
    Dqe4DgJjMPnlK4WgoG4UoRPv8KB5d+hbDv2o2t79uWli2h6kBR+54AW77UpA
X-ME-Proxy: <xmx:oq_1apRThMMkkNGJOzyUpycDUFHQQE4INZFdKrFWfr2OWu8HTU-TLQ>
    <xmx:oq_1anplsAN-TbH3FxxNXMyiawEjF_2FUQ0eKkV3FpIIPUs0FEFGpw>
    <xmx:oq_1anYZC5n6m5Iqm1LV-oAHoxmb1zzdOln3kyIuaSt5-UeCt-vtNA>
    <xmx:oq_1aiQqZcsE9b5m0AGqWLb_c4i5j2hdZ504PsPdpJkby3ByOXXBsw>
    <xmx:qK_1alc9eIARixlfcZspNkIdgxoj4uKJOu89rmelOEnZi-d-kZjREk4z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 79EFA32A0099; Thu, 12 Nov 2026 07:22:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AfXj_ROFnIdR
Date: Thu, 12 Nov 2026 13:22:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <219f5451-1cb7-4a2a-8423-3a071f8ad42e@app.fastmail.com>
In-Reply-To: <avWnS7MLyPaJLaLR@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-4-arnd@kernel.org> <avWnS7MLyPaJLaLR@kernel.org>
Subject: Re: [PATCH v2 3/6] ARM: drop CONFIG_HIGHPTE support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_042315_535775_7C433035 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, Nov 12, 2026, at 12:47, Mike Rapoport wrote:
> On Thu, Nov 12, 2026 at 12:25:25PM +0100, Arnd Bergmann wrote:

>>  	if (!pte)
>>  		return NULL;
>>  	if (!PageHighMem(pte))
>
> With HIGHPTE out this can be 
>
> 	if (pte)
> 		clean_pte_table(pte);
>
> 	return pte;
>

Makes sense, changed now.

     Arnd

