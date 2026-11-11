Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44195606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=10G/O/TG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hjkf1nv3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HSCvd+sKcy/x5N18/OwME5CoI7fmfzufVnmhSLVqNak=; b=10G/O/TGqv1MRZUuI+iypVhHFu
	ALDMdlDsoAWatpC4F00yf5Q55l/zPRZ87PULQ9H+GiPUA0DmUtw/g1ITYjvZF2EjihEaAFyxU5+Um
	eGtyggqNswaglSJOO34nNabUW73hOEtEzF/OYwDqTJu6IRbZsdV58HL1xkKIW1jjXBibz5SxSBt24
	FudluOJ71BwhnKJLI5UBm55LqP7cwOIwtfTfsggYTL87i35suI9sqPIBXuMFigUnaxVjU+tzYzHSy
	nA2+UKxXlajc3r5eM6b/s+n29cE0NFf2H3AoCYK5JyIcwQ8VNfOt62lL2JChkdVGZedEQS8e/qW5B
	ipDWgxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGOe-00000007tFX-0kwz;
	Wed, 11 Nov 2026 22:02:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGOa-00000007tEa-3n9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:02:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso28355055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434538; x=1795039338; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSCvd+sKcy/x5N18/OwME5CoI7fmfzufVnmhSLVqNak=;
        b=Hjkf1nv3C1I0PIVfcfTVAOdOKAcWm5bNB+52A8hHMWuKuZmVPr5ZbB/LdePfKi6LRm
         28SB80l09MODzY9UHGxfgUDnlcxwUriYGBs89PwXJJ/4tmKyM7idpZA0C7h0QDVfExyg
         8NimbwZyURGCEUmIJEyInkrRovr+Kt+rnlpfWX75WWMtBZt8PjDPpoId8TZSuutO2cge
         B0dxSDcgZ1d2l3E2XBknun+7Q8kLh0PAvaUzeNdPoIRr6QPXLlPg3/fCkKTNRl/szrS5
         439aoCtEXfW06B2OBKzAGafuPDgQvXB10xc9KwzXeid3H7QxpPSvz9CcEnlE+IWqLQxQ
         NDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434538; x=1795039338;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSCvd+sKcy/x5N18/OwME5CoI7fmfzufVnmhSLVqNak=;
        b=KsTZO4kXaNL1FM9snTuaCcrR5ADdzG0HTyPBZryZ094X/zfPjOCRtbF7CdKbd9VCMb
         GM4dI4R1OQW9MVatlg1m10zR/4mqVWRbXUcZ3kR9DGunjiLYpPwD7PFjX5lHvEWtXYj/
         v11CkyV7AJ6KOhoHDUsDfa6Ek3xgZtvztug5P3zvfaZ8pxrrYg/oyErTa3dLnltH8Trg
         EFiF6ndaaaIhK1BHn2GUA26zef81AqC9mM38yPohHV53WN7cbsFExMh+6XiJsWCIYuFn
         V+6be06D3w4/bhgEgDgiyOiNuEDd5xzoqsa/yHJKkpqk9efwKLofrWsPrFk1iZTNApyF
         9U3w==
X-Gm-Message-State: APuU4Z+VVhyB0NYa1Q6YjtUxlkebHKgiEG3ipfbVNinDuWVA+kWCfC4b
	z+NR1/O28zWglSfOYQVm5OWteDRjBwZWUCN1kPY+Hd2zs+wXMUE6fC7m
X-Gm-Gg: AYBFou2UH5xhlbBDF9p02o4hH+YUUl10MbL8bljIT+tWowur4ikl4FV663yCSRdYGt6
	+EBGy2n9jFVjkiV68xsvCF7GOKm0XSg3zllLPxBn7nxBk5qb/t695nE2uWH5H/gLKUUGRzma0Yg
	/b8Fe2xkHnYnD7tiDjttSojVyI0g8oqEHYG0pmo8e+XqvMfnFccJ2TrYniZfek0AKunW9e3i+JN
	0RUGar78EPpxHwYKAIBk8an54sn1RE0tFoff8tAAX0l8p/8ieimR3mVUPV74YeBwo/m8qUbtPZc
	YmTAIRwRqC0UH9s9ZUmdtL9ceK5hipuWYMHFNYEqcGF7hicbT0F46VnaVOSFxe2qX1tGsKnpyOo
	275hnXQuxvSw5YNPfiuSPUgNNlsKJdLghJEQuHZMzmh6iqtJtpNmkweMiEFDpQ/duhSVXAFcbIU
	MboYQIVoFGX0CJsLWeYUlcvB8XqFkxMvi2qK9NZgF1iu5mm6QpmWMq9hw/ogzRxH+FfX22XWF0E
	OD4M1cYfE7iuHNrI4wpFoWzy6nE7UwiPTPVa4Ci5kYfi9boizMHJv5WsYoPJwvuuEBJJdrTzco4
	SGwk+J52Gt1V/qNcBKHacHyxOh+C3UtzoLBwrOOmvC26
X-Received: by 2002:a05:600c:190a:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ba0931ed3amr68718305e9.4.1794434538175;
        Wed, 11 Nov 2026 14:02:18 -0800 (PST)
Received: from silicon.doe.home ([197.250.160.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm18035215e9.11.2026.11.11.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:02:16 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Thu, 12 Nov 2026 01:02:04 +0300
Message-ID: <Lv-2l5qpSwW-LGAsxs8loQ@gmail.com>
In-Reply-To: <20261110153522.1620088-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <taToYWqTRsyGXzOXNcd5Qw@gmail.com>
 <20261110153522.1620088-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4Wgsehp6QMiK-lmXVDfWbw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_140220_964600_CE6C8AB9 
X-CRM114-Status: GOOD (  19.39  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--nextPart4Wgsehp6QMiK-lmXVDfWbw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org
Date: Thu, 12 Nov 2026 01:02:04 +0300
Message-ID: <Lv-2l5qpSwW-LGAsxs8loQ@gmail.com>
In-Reply-To: <20261110153522.1620088-1-isasmendi.agus@gmail.com>
MIME-Version: 1.0

Hi,

Am Dienstag, 10. November 2026, 18:35:22 Ostafrikanische Zeit schrieb Agustin 
Santiago Isasmendi:

> What ZTE does (from their 4.1.25 kernel binary): l2x0_lock is taken
> around every line write of the L2C range operations and around the
> Cache Sync, and around every register read of their mt7915 driver
> (through an exported fixed_pci_read_u32()).  A later module only makes
> the lock finer: the range ops drop it every 2 KiB, and a pending PCIe
> read makes them drop it early.  I found no chicken bit: their L2C
> setup matches ours and their PCIe init has no such setting.

I haven't dealt with caches or PCI myself, so I have some clueless questions:

Is it possible to program PCIe mmio areas as uncached in the level 2 cache or 
tell the cache to ignore a certain address range in some way? If it is 
possible, is it enough to prevent the crash?

Do you have a guess what's special about the PCI address space that it 
triggers the issue? It sounds like it doesn't affect other hardware or RAM, 
otherwise ZTE would have disabled (or just fixed) the cache entirely.

> What goes wrong: a PCIe read on one CPU deadlocks against an L2C-310
> line operation by PA or a Cache Sync on the other.  The TRM (DDI
> 0246H, 3.3.10) says those operations stall the L2C slave ports until
> they complete, and here the PCIe read apparently cannot complete
> meanwhile.  3 boots x 8 minutes of WiFi traffic each:

What does "TRM" mean in this context?

As for the patches you sent separately: I can't say much about them since I 
don't know the pl-310 cache controller. I guess I am also lucky that my board 
has only once CPU :-)

--nextPart4Wgsehp6QMiK-lmXVDfWbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmr05dwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiGVkQAKzdA3BXSLcPIAbwMGF3
hs9Waj2wQ+Rct96z8APYRaKJNXzByrmLB8rdKfgc1clyW0VGhGQWb1aofi09i4y4
LwrLCzdLTIja0JwHoHaH/OgiDrHABA7ndKhUsJKQqjYpug+OaO59Jf83831f0HdV
ukzunJYC1peYpN3pYEpaYNhqxvUl7GwAHJuuUIroWSndrpvlyUN2YHQX2Vkn+DM8
cv2EAamwQEc7EItDbNeQwYDOA4bxHngN5eMKy7tYDtxwElI6BWi17yPw5GdqzIti
OF+woNfAiTtZU2er1Kl5u4u993pH/3rmUXpUCNNQdn6uAfWWICukLCAQKvt1jm0T
iyb62gacWJqEivpafMEsDVCyjvHUtin+Jxu6yxjPLROdspUO9QOe9p0UV5JNbAzq
/ga9yZBO40MKsjwL76pHrkU92FMCVIfyx6/4P+64YXBxNfSbTO+CVDmpwSkJ63Rm
J5aqXY+KP6CoPEfy8v496gB0zk3sC/xBWXKaDnlm0jFO8RNhYjRvVsy/RHkbdKR+
yeGViCvlO2H7OjFxyj9ChhFgcqAP0Ym1hlrh+9jnSpNVd3ePygpFjk+ID+nodKva
ibpuRVSEKpH2JMYpC25TpUkTWKQp/al5VAAYmaPevJ7W2FovgthEw2/7ZSDlD373
/39naFBD20Yh2j0DVkPPbv1s
=lhnD
-----END PGP SIGNATURE-----

--nextPart4Wgsehp6QMiK-lmXVDfWbw--




