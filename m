Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA440606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FAdvRinD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fg63I1oK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0xZimawL2d6s5mil9vXgjgzQ+qS8guj7DlGNFL3/c9I=; b=FAdvRinDiQLX+n
	A9Z6ZSA/OpTIqR+rMwzoEyeAFyh8nAfd+m3AJXrVrnlgPYrgPPXq70cMAgR5skhppR+0ykzUYOcqP
	Z/wCvCDNZvCfi5Xsj6Hq7U6KVW3Qt5E/SkVrkq/jgCyQGWDshUQzRvb6n476r42GrURA2aHFEFltw
	uzbcuoukULsFenF62Yg90izAZgLja3KMq5JIU+srQ8b8/6MxsMug1hZjTxiSlOZmtqZGHePj7tDhb
	M42U8O0BEHAWeFr7BQp/9/e32fNb+bmCj3S3rRTBKiwlXwpmbQGQEEhsa+feTOoT45UNZgxceOU4U
	kWS+ESmno+yWwMBEZowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzWS-0000000Ba36-3kaF;
	Thu, 19 Nov 2026 10:37:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzWQ-0000000Ba2G-1avP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:37:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so15235165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084660; x=1795689460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xZimawL2d6s5mil9vXgjgzQ+qS8guj7DlGNFL3/c9I=;
        b=Fg63I1oKU2APSLDnpGtwaid0QRdL4TCf9ky2Tsb4J+KwZvJWF8Yvx84NNlJkk8gVJF
         kq6uesWiMtNSocz3Ncx1wno0df0cNEeqSzZYgjv49eAMBZGdl+vo1tnYoPUJVGzR+X4j
         LgWWmxgLJFoxanHJokwf2F+a7Y5Io88T+Og5tBSWxjZuXj6f2+aeqt0pWdP3jQ0R0GAX
         bCG3Mp6sPT36o3wFxiaCSTS5odNi17wh7QQcq8myyHmafUwISTZ26X+WTaqJi+3hgc94
         wnNYarZQ/TlRQXkEWI1b0l+3mns73GHIpVbXM2nBpGU67FPTFo9jPueX7j05I5vp03U7
         2hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084660; x=1795689460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xZimawL2d6s5mil9vXgjgzQ+qS8guj7DlGNFL3/c9I=;
        b=gwU+SYKXDAQO2uY0b+vn7ubOVDBleDtwmlCRHxOU66ogJ60HVhRtsJjrPDPmrJLUBB
         MrlXeoq5oJg6NxYqklZEQBs67Kl94onIBYs/AJnHPMM4/yvCYWh+e1GWpNVn6C5eKkM/
         W6FGFZB134H5+Klj33OXm44/BJXgWdhL85/1Fk742s8l5kMOWSjkT9uLU7GmvjTsEVL+
         F392hsiBP2F1mlVjHivPYPEQfoh3YTFYRPgmhyrCCzaqcKbxi/ylzWOZHY0QPvUSKEIU
         RyDnp5Bzyf+vIeWSYRJc1y+sY1L49OlhoW/jckoHK+hCLViIR4mAd01SzhYxIztPmXCJ
         Mv3w==
X-Forwarded-Encrypted: i=1; AL+hErHmyhhxsMXCAuNu/yhCnwVyErp4rgCX2Pzc2zNv8b6UKp7aBLac1KxIVFdbg1XeuUsGfkRHXY/YynqgOn5R9tmc@lists.infradead.org
X-Gm-Message-State: APuU4Z9EZIBo0fh2te/Vl9h+MM4buaJLk9/B+M1NLcEQ9SHvpbUBpGzJ
	zruSyzmRI+dPQL6CO05qdpQQar21U+MTzpIJXPMDYpKHUjHz5pD04PJL
X-Gm-Gg: AYBFou2zkZlOPu9lG7RlDl91DEUjz+EMjNV4M1W2T0bSpPveV0XojwtRCHFQxjGREEq
	1ObHmnvIjLw5qs0o2PqQ9PdJJHeSrwvJBWFNWnXPzqZaVArBMeHItjXDjUJ7vC0fZFWBguNTaJy
	2GyROPgTiS1wwqMqQ9KRVmOtt+KPeggwaLUcbU7MgPR8Okz5Z0ixK+pl9EBegma98cE2SiZn3Am
	iK/5/YB/1qnzqYmvAVlWt82EWNiQmvo3lp7w6yCYc7XSNy2VwRQBSRfRa/nRMWK1kHPOHEcrLk+
	ElEkHcmAiNu23GLE/oAUHPIKT9UtgWjrfpPQzKLWDl1fbT0ZTR3E7p2OWXsYwIW2kGtt1ptFdoQ
	2Nsqsw6/N/13NbIkZGCCMRKHlQRrRR/l5DIlrNo6exK/4P4VJBkVUGVqIN1pARwwdUWmYRJA0HG
	HpXC+Gz16/fvQnfEcQzuKtnyq9AbNccXQXkk0RqmZNtnej6LBUJT6kBLYPvNvMcFk4VrsD3oOc1
	0/MJXqcp3gxdOOy3MWnGCBeTVArO1Eq+O3MX6cQY13KJG/EkknFr3kLzvxyfAF9Sd1WaIrewn1C
	HgT5LKHj569k4jXpXROfBrqV2VKhHe9l/SLJY4o=
X-Received: by 2002:a05:600c:501f:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb7da462b2mr109990135e9.29.1795084659786;
        Thu, 19 Nov 2026 02:37:39 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f1a9sm24290945e9.3.2026.11.19.02.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:37:39 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: stefandoesinger@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Thu, 19 Nov 2026 11:37:38 +0100
Message-Id: <20261119103738.3525992-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261113003635.3664249-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261106190828.3823287-1-isasmendi.agus@gmail.com> <taToYWqTRsyGXzOXNcd5Qw@gmail.com> <20261110153522.1620088-1-isasmendi.agus@gmail.com> <20261113003635.3664249-1-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023742_464714_B7D9486D 
X-CRM114-Status: GOOD (  13.81  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Navid,

Thanks for the tests and the numbers.

On Fri, Nov 13, 2026 at 00:36, Navid Ghahremani wrote:
> With the lock on both sides, PCIe config reads of the MT7915 still hang
> my unit.

That fits: a config read is a PCIe read like any other.  I hadn't
covered them in my lock either; when they were left unprotected in one
of my tests the board hung the same way.

> Because of these numbers OpenWrt will keep the cache on with the lock.

Makes sense.  Two things that may help there.

The stock kernel makes the PCIe DMA hardware-coherent: in
zx279128_init_machine it writes

  0x00a20080 = 0x40000001, 0x00a20084 = 0xbfffffff,
  0x00a20078 = 0x00a20088 = 0x1f0f1f0f, 0x00a20000 = 0x0d000000

and mt7915.ko uses the coherent DMA ops.  With those writes and
dma-coherent on the PCIe nodes the mt7915 needs no cache maintenance
(md5-checked transfers, L2 on and off); without them its firmware does
not load.  The switch DMA stays non-coherent.  The same setting also
makes the IDM ring coherent (stock uses it through the cacheable alias
with no maintenance), so the WiFi offload RFC has to treat the ring as
coherent when this is on.

On my unit, with the L2 on and the lock (Mbit/s):

                         plain   coherent   coherent + offload
  TCP router->phone       432      525          530
  TCP phone->router       235      283          288
  routed WAN->WiFi        253      237          270 (CPU 46% -> 16%)

And the lock: I reworked ours so that only a small hook is left in
mt76 and the rest lives in platform code, which may suit your OpenWrt
PR.  The L2C side wraps outer_cache in mach-zte (cache-l2x0.c
untouched), config accesses take the lock in the PCIe host driver
(your lspci case), and mt76 only calls a small outer_io_lock() pair
around its register reads.  Your config-read test with WiFi and
Ethernet ran 3 x 10 minutes without a hang, with the same throughput as
the old lock.  I can send it to you.

Agustin

