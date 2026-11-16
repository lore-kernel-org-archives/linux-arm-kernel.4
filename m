Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C55606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LgzjjuYG;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i6lUbos2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Content-Type:
	MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=; b=LgzjjuYGEgU1jeI1Y8+R6Mq5Nb
	2UH7ASNGAF4AoPfKwP0liFMQ1SYqOhWtmuJC1PqgGgSGM+GLA+NgYvTjMkKy4aEqFPCZCvMdHeNRZ
	g17Cl0uy5oUX+A42yjeYWyeWXllSZprv+AGfgQ2EBPTWL/AZFQYUq72GCccYUDdn3HkWJOwh+Eq3y
	yFde5wVDpS3Hw3staKPWnzak4UJ38KjpQOd+7Q0fArnL+kKGekJgJd2jR1aDmchB+xCYQket9hDJU
	AFmJnTVuIp2tDaTxyo8m7ORZ77snlr9GyyIKcbSaf/4Kcxlt/GqwphTm/nqYY7FCTMrxxKzFwtHK5
	2y7Thhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoQE-000000018Ig-3VI8;
	Mon, 16 Nov 2026 04:34:26 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoQB-000000018Ht-28dv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:34:24 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3268142c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 20:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794803662; x=1795408462; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=;
        b=i6lUbos25DM9xiuGE78IVCufy7DkJupTHD1nOeXxULL8HqSJlbhudyXfUnbXWq9iME
         o15yVf4V6jvKlzig4haE65+QLB2TLOTubuxoQ2ZcowecO684NY2NUanBToFDcRY7Btlc
         O2NaE4RdGpRDYU/Fi5mgoTooABUZbwFrgjrL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803662; x=1795408462;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=;
        b=lHnr5XxDK4c5lVhjauDB/hrnhqTDJmlrkLQDIBfhFRyVfh0LV3VsYl39q52KvlN6Bt
         WCN7WpTqYwuCkxvGiLSsUyFGnKObC+MYpY/ebJIu6fpIvAAMrh/SMsrLHjto/dZcukDw
         ImLwI7A/CCSYYqJeW+Rz42G4cFdsJpS6hh7RKmHZBdxhD4DhvUCkxy0vq+OdEccw/7ru
         s6kYidIp4FJptr0fs1n0xT6FRFNaz6ckJaHWIIjEkfoMoDDZPONQUIiUQG6NQTj1qTBP
         Zy1kQFoqVAoZBzRB+nC257W7u2bgXyzUaP0j0r7tjmtNJhJyZ6N6QrHBDv8D1rqEFaBE
         dYVg==
X-Forwarded-Encrypted: i=1; AL+hErErUUQxf5hkaVQKo93pEcgHe73JF82OnTSbLPapPgGywRMWzsGB5nA61ultqyFGZEvC2a0BW5k4upGc7toYJ2Oj@lists.infradead.org
X-Gm-Message-State: APuU4Z/1J4/E8OTpKmmX5FAIN9mMbGJrbIwH7JUVNwIYC7IeaYHcnR6L
	T/0GHLFwI3NjsmzBC9wh1yTMaUUVcZfiDkuIgAH4jia7aqNRbIJMsPNsRDnwbmHpVP2R7//HpZn
	T40tu/NJA4BRN
X-Gm-Gg: AYBFou0CfI9PfCOpgrkqglwCBxitKaImG3OewbIY6zJINcVQ8BOY3Vol1DZZnV7ZOps
	gjNWEOPB+0dmsnyyZpYhODu5++qPO7agb86cY+1rjSmqO318SNf1TTaP5pRoZV7HaE6Lfukumjk
	2yox2ftltWF8LXXeEClr6ale5EjOsL0FiVcS4bzAfVTUtYh3CYEfSyg4jtLJXWHzDSqa1BUogaU
	ByERO8L9LKdXtrX/tqldFypV4JFr0Kgzjncw2iFgkgHRpSk0C0qeBjbrnHU0nWDqn4MvB5t7ACA
	q1szsJEmDRAFDUe537pEmdAZFyi9C7SjEkREA5G1VXS3xHNiL2F9NPMnJo87uYzCZr/lEAE1s1Y
	+RQVWsPqTllTlwFTkLRyBC/M2sD8+OePKdZUhW/3C/k+9OwGbkS7z1AbtcfQShyJjLoNRlfO7qm
	ygY0aPgnlMjPoRuieMGbdmmq7dzBicMAwMKBdnxySOUtz9sxw9Ol/WtORlaeBR1kbRoQHZfUNYj
	Fw4yNhB9V9mwiULlh9IeFK/8MjkCOSub/wm0xzJ5keMdPhU78rS6avcSpYXxHig8XyvkG+tLZIM
	hvjvCwEOj8zmj4UMV8TZDCYVczIr/ynnGa4V5EO9s+sOa2CnynpHi7+m7B1w2cYewoX2sKsDH5X
	y32f+s0OXbgSfpxdA8dZu6JsFhdFabwKs0ODL6HdYLeOC+r9dVn21pNCRiGh30dxhYlK5X9DZ5H
	EkksBrhos8epAh+Wc/pCtvga4SHxqYzkYvMzsgN7AwWiaF8tmZKiMs15q4WTDN60BU
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr9813315c88.2.1794803662025;
        Sun, 15 Nov 2026 20:34:22 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm2576204c88.0.2026.11.15.20.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:34:21 -0800 (PST)
Date: Sun, 15 Nov 2026 20:34:13 -0800
From: Chris Down <chris@chrisdown.name>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org,
	will@kernel.org, David Matlack <dmatlack@google.com>,
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com,
	loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>,
	oupton@kernel.org, alex@shazbot.org, gle.com@google.com, pbonzini@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com,
	joro@8bytes.org, kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/19] liveupdate: Add feature header to struct
	luo_flb_ser
In-Reply-To: <20261110050202.529473-15-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
	<20261110050202.529473-15-tarunsahu@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261115203413.eaa54fcba43adc22@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_203423_568123_4C39D07A 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tarun,

Tarun Sahu writes:
>+	for (u64 i = 0; i < fh->header_ser->count;
>+	     i++, fhdr = (void *)fhdr + fhdr->size) {
>+		struct luo_flb_ser *ser;
>+
>+		err = kho_ser_validate(fhdr, luo_flb_ser);
>+		if (err)
>+			return err;

I think there's a problem with returning this error as it is. For an
unknown required feature kho_ser_validate() returns -EOPNOTSUPP, but
callers of liveupdate_flb_get_incoming() already take -EOPNOTSUPP to mean
that live update is disabled. pci_liveupdate_flb_get_incoming() returns
NULL for it, so instead of panicking, PCI carries on as if nothing was
preserved, even though those devices may still be doing DMA.

 From a quick test with an outgoing kernel hacked to set an unknown
required bit on its luo_flb_ser entries, that is what happens after the
kexec, in that the PCI FLB is never retrieved and boot carries on.

Could you validate the entries once in luo_flb_setup_incoming() instead?
They are all written with the same header by luo_flb_serialize(), so
there's no need to check them on every lookup. Going by the code, a
failure there would panic through luo_restore_fail(), like a bad
luo_flb_header_ser already does. If the per-entry headers end up going
away as David suggested, then this check goes away with them, of course.

Thanks!

Chris

