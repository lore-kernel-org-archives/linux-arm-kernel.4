Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0219606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywWv4IGO;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i8VxVDcI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=; b=ywWv4IGO2xyEVe
	y3WyPZOZSA/+c1EtYp1FE49VBtE2RG7fPx0iWsWiBP8lrzuFaaEkHV8ZtQD4wDr9EiquTLATD1LHU
	Ckx7oxrkOZgTtzd4DJELWjyme3ZQnF7kGpS55zd3BGZ6DwMs8HduChBRlmO+SP1JB4dZMxA5ssutq
	JTHHO5zol07mpDwEV4q5n2kRYAbfKztwxBd7d1HsUUd6xGcBYBxHYIJ7pmVNuoSAYoSxXvkhbcrpR
	shB8ONI4zpyiyyFE5aWPXiiLjGW60i5zLOHa0u6vzYckqEsi3mOHJ7HI/Ppf5DTIjgjs+EGNUUzMe
	ovAIsZec9XYxq/EVImhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzaO-00000003E3X-2kJi;
	Mon, 16 Nov 2026 16:29:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzaL-00000003E2e-3tLF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:29:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c247f6687dcso660693066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794846575; cv=none;
        d=google.com; s=arc-20260327;
        b=GmH8aD4xtkdoxcnrGYjXtV223i6fDBrRKQXlnQBdGOYucFMZCrgAmt5bzyiysaw7dB
         AIOYQk912ujnRLmChYrMz8Lc6tL8GN3XbgAUicqClRNW0N7jROnwLt9y2nV7gIYu9VUp
         NWjdxK/yJlefpNAtbaXDmjd5fQxBPVa5mip02PuXPN7HJHu0+uz4JFllXvQ1FDDCtz27
         QG1yTTvu17386QSphvpXTvN7s2DiyYDuAHoHpVA7zysYZBJA0+IvvsuglblaAU6yohYW
         BCzRUjjoLrbIQAFNNYYJ0Wv3GWNwD+7rfUT6QLDHJiFxUnFESngXrgnr+4PDQGBolLc0
         ltFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        fh=eu++iv60gK42qVmD458dCwlU/qQj3ZOeAmEQ1StUGFA=;
        b=hV3HXZNcBburYjZRXCb59MkMdV4oVvAzkLmCXdCPYqtIxUZKjWahSgf5P+qDMyCMGA
         sgGeMH2cis7Ldnz5nK9gTzampZEtQj1nW9yHwIewvPGLyOD0ro0uyEECd43gUgWUYyQU
         kMLsF3WhgP7QAG83Zvr8Fo9StsdoMlGhGLoJQiOnHrnAJNOk5LWqcHZRce0+lRFywZn0
         B32ta/U7f/YVB/gwypEaf+neSPJZjLt8Ec5x6v9lDQ1b9ZTa8Gpwnj+hRQSTDcsJz7Qc
         TKCQuZK+04+7scSc2eefQcBxQsMbJdY+0iDUIVJRAA4YTVxKG0wgn1sTx9kqWtDJEmBV
         Bk0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794846575; x=1795451375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        b=i8VxVDcIjd+Foot89N4vExiRkEwq/oSR2vEAqQm52rDZ41WHrs7xSbXSjb/+JBnQUd
         B5UJ8NobGw6Jss8zMHdIzRGhSfJWqFBIY2/31LvS1J6sPVnmPpxOjsrb8pHiqoQjIsv8
         HB3eRQytBPm3YZqM8jf2lzR7TCni1fudSaJ/wL1UImzs+yqYsT/+sCP4Sp+4JvhkwEdN
         HHPpOJEEiJgn/EEaDI9NEqlSGrDji1tk9OSpp1tyP/4coW1s29Hpw5P6LHdTpc4nCeas
         Avay+SDh+P/x6E2ECE21pj1hpakV9ql4o4kOvuxFbE7VbnFQfIHbNOicvcC2Ka2JSZkh
         6jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846575; x=1795451375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        b=MVH58B79pPlL11pYQpeyzgU8ppwxGBrOXnn8c8MMBaFhFdz+jA9G2GHDl0yhBe77Ro
         PjF9PqMq7UYYy8cRmgteJ04UtvJPp7JknxFycu//4P799xirNphoQlSD+Q3pmjy/sLdT
         5OAHlE1VS8mHxUr0RfH5kBUHweV1o3rJwXcVINDlMBBlEPtdMQP7+K3mIzIF0/M/KgdG
         xNVhQhwKas5zFSYwuWLt9PhIrD5M13HZMk8W4Qk7nZ2rKL1s8X1sE8q8w/vxjTP1gF5z
         c4PL3O5HKf6pcGvGY65N5BLnWATQ+X7hvBCaeuCGwdmsGRC0wV7t3gNtxvkzw0nWxXkY
         /X0Q==
X-Forwarded-Encrypted: i=1; AL+hErGKMu81sC4nXDRPzOQX9B6Cwt/Imo/iwDnby5fPtBI8aA+dMQ4HtTeaNxew3EuDHNewzh4Mh6amRbV2iUqIUoJx@lists.infradead.org
X-Gm-Message-State: APuU4Z8Qrc3Vl6uEsHRPDOIcmSzdjMPoahuR6I5F70PtPI7ZWgA+jlG/
	Wet+XfhBXYvexrajQc5Gwn+hlRotl6lbyWNSwvM8qln7dthVJm5AIPZzWoBXVsN8Ir16PJlTOef
	gnOmj1RqjOO9Nkk+FUgS3gvcVMsDdxajeJJZE25kp
X-Gm-Gg: AYBFou1uiBKJNd0RXly75RMKrfb+nL8KlXWVOpCaLLHZeT1nXywbl84ZF8yI3BNxcGx
	2OBlzlqBz66wLZtGoeDdVJ94S9p6kyyiFyazt9N8y08gba3t0mPDIUbRqFXONaU7Pek9SUivYjx
	HxR2ASmlN8ADvzjzgXlymi1Vx1DWkw8YH5vC8qqtt04a1IGVZAEqRI7bTbGNzS2UmJVW3V50pTI
	FyRu9ixKs/cjsPdixrugEoqBsnnqoRMOgSFv2UtnXkNeJx/ZivwVfSI/xDaltku54y9PPSHivEp
	8Bqi2bbC2IaVxhmWoYMklvB82AxACsYDflYd4gh2k003cBNyigUYkkIQr8Z8Ej7q9jdeZBLjo25
	bNl1PP/tiwro1VPUXHaKSHJX0GCF30gOY2zHlaHn8Iaq9LC9pt33a1T4lhqQbs22OU6QRo9IhJR
	BmjjQYoW/KvH+zQ5YiJHqZmQuxWiTyW23g+smxYRtzbjpPUQan
X-Received: by 2002:a17:906:ee85:b0:c4d:906:e979 with SMTP id
 a640c23a62f3a-c50961992c5mr881499666b.3.1794846574496; Mon, 16 Nov 2026
 08:29:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
 <20261021212738.321547-1-jthoughton@google.com> <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
 <7C857138-E17C-40E8-9F72-6FD3E3AB493D@linux.dev>
In-Reply-To: <7C857138-E17C-40E8-9F72-6FD3E3AB493D@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 16 Nov 2026 08:28:57 -0800
X-Gm-Features: AclHuK-zpZUq8W9nNoH-Fxmelqg6hPrcZtO370EgGILVe_jjsPQzSM8Wu11E_Lw
Message-ID: <CADrL8HUkUJHW0oT+tPhhyYdx+5+boSb8QRk9Bwp4mzVGpgRg0w@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
To: Muchun Song <muchun.song@linux.dev>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, 
	David Hildenbrand <david@kernel.org>, fvdl@google.com, linu.cherian@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mark.rutland@arm.com, nikos.nikoleris@arm.com, 
	osalvador@suse.de, rientjes@google.com, ryan.roberts@arm.com, 
	sunnanyong@huawei.com, will@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_082938_004323_8A533A1B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 7:46=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> Hi James,
>
> Could you send it as a separate fix patch so that we could merge it first=
?

Sure! I'll post it today.

