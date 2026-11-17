Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PvYqS9zG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFhoxLfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=; b=PvYqS9zG7iMJju
	FtyoR8nlLncKjNAML02b+jwzPFZIi6L5r9+f+by1ZMYGj6QcaLAyvPKP8P7MxZ2BL3aue22gYtzce
	E4o20Nb+553IAViIG0KDbjqc2OfZqN55i3DIbCCE06HDitTqs7UZCZK7+AnRXpH4wgoBC2heM+L3r
	3pwhcZJ37ee7EL30Xspex8bfRqLw+JfmzjDeQFZApOgWD4JDVgouuzVMbKBBpi628nvkvfcDIJR7L
	7aRAdKVobCJ/mKE2VCAVCecDK0MW8Gl1M5RF1ilGEquACW7SvRcY0qIU7sve3Zgw7K1zVzdBHvb4r
	yZgYCRxByvpcG4gXspnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN6j-00000006bxE-0nqb;
	Tue, 17 Nov 2026 17:36:37 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5Z-00000006awo-0REk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:35:26 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-862aa241d77so6311a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936924; x=1795541724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=eFhoxLflX3jdgP0CGfcO8SDZhSQXGZBd76kXj4tQRZce4fgfRv0Wrir7ergGwmjfd8
         fArGsfN1urA/caLU4LvORU+UaU7p7GePJXBt/UUbH2UDxoZaIZ6kED+4k1vYKpL5nYdY
         UnF20QBKUQNQFvdwpKvp/1ufsZkCAN4BdNsN+mfwCBuk8vmP8Lk13BUt9t0HgB7cA4pa
         zQj7NRj7lRYMueL34JcdDKkDK++sD9Ifsy1RUZgmwOf5AZjaFs00i+I8mwvEqB13giOd
         19y884+EC90DCLU50vSu/Jfh+BCcjvbxNizrNGhyfFMzFMXooL4YfgMxeXStMDOGu501
         gLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936924; x=1795541724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=bItIDyoABh31yvnktkK25uOfwIjUAo7CTNG6cOeZTeeVbiR2sfIYgcvTlNnv6u/C5H
         ZQbadyOQRykTJ+kZT9IeKpkiSHVEqhwXNyLNt42c7cdNeEG8jcDpeKeapbd/RGAFF5gL
         YyCgxJNbVf1Ygn8CI0I8MAMY6OdCOz2d6Lco3OleTMpVGpj6VioPaPr5wyNscKLMhlMX
         iXk6JXkjzEOSCmY22CW6+sF79znmf0guR7QzToR1kFGkAOl9eII9t4YGSCCI7vG18X4B
         r1tPHYqTluHGCp3IIM0sfQ93kNIDzXxPhkuONr7Jvb7NceOkfG1JPL8uADgXaThjWzTD
         ixFQ==
X-Forwarded-Encrypted: i=1; AL+hErEPpTCYEONY6VfmoxFisCTi8VWvxPsGwnLElTfcweszMKXFcZ2GVvDxqh5XIwMrPF9lovD7YOepHanO+OwMGeAI@lists.infradead.org
X-Gm-Message-State: APuU4Z9pjIEDKjjqaHQm+T1czUj48nQZPpc9PNsQM2q6+/BHOxq+kYHi
	JfEJ44ibj+kqHjIzyuoKnmRjjnQbAimcaGWtefzwHf5Z9Bk6KlaI5luH
X-Gm-Gg: AYBFou2XgqTUgPTKlFhuFDbc9VOeTkRBEO1MAsqZxKfsX+eR5LssdJDrwLWVvUKRVMV
	Y82WA8dCIJc71tcLy/dXnJT1spJc6UEAhzeGc0Y9Ip2dwFHzFveNGCrlIxS2hbTwRDT6s08fIQq
	ZLBiwT7rdR3syp42bzIMNltofVY79S2KRDJ4TyxOFZ8Z3/AF8G760xQfTDnil6Bbe9X+Ux6cZEX
	rAsikQlIceQaGwQIlhXiB7K3+umAw1+789Y84JaaUkXpNF9rr/uejlqNWwRoaZN/es39TiyCCoN
	AeCXvwYI5S2m3dM4Ez9gsI7I1cFvrnzBEr+HsCRNRXowhOPrPGIgz7A9SBIu2O++NM1UM8uRKva
	RhBzsN5abRrG02CO7H1u1jIHxRkQxMQ51DwSFWVXysK5b0rOazUv/5+G+ke9MvUTAmdAZGAGfgg
	LGkf/CzfVz6Z7/j67zFV1HE3Tboa4Q6T0Bhr5Q8lRzK0D2reokPAfYZOJ+ZjgmPWZl3nYxmR2IV
	6xxL4P3k6DVXnDX5ruRbGcGgvGGV7zWU7J07aLS1uUBMf/1QqkbRJ2BBRE53UV6B6OfKuaXrAO3
	jlvfOQuH7Z1osxhB+Yj1kaUb+IwAprcTT0mbjxVZzlNc1A==
X-Received: by 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr429178b6e.45.1794936922568;
        Tue, 17 Nov 2026 09:35:22 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70bfeddffsm190834fac.4.2026.11.17.09.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:35:21 -0800 (PST)
Message-ID: <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
Date: Tue, 17 Nov 2026 11:35:20 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093525_156864_5221C6ED 
X-CRM114-Status: GOOD (  14.14  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On 11/17/26 5:02 AM, AngeloGioacchino Del Regno wrote:
> I reiterate - I couldn't pick the series because, of course, that one 
> depends
> on the binding being merged, otherwise the header won't be there and 
> the build
> fails.
>
> So I can't pick the DTS until the next cycle (granted that this series 
> lands).
>
> Cheers,
> Angelo 

Thanks for the reviews, and for picking the binding and keypad patches.

The AUXADC series has already landed. Jonathan applied it to iio togreg 
on 11-02 (the binding with the header is 8f809aa84698), and it's in 
next-20261116, so it will be in 7.5-rc1 along with your tree.

The board only uses the header once, for MT6397_AUXADC_BAT_TEMP (1). If 
it helps, I can send a v3 of the board patch that uses the plain channel 
number and drops the include - it builds on your v7.4-next/dts64, with 
only the binding warnings you mentioned until the trees meet. I would 
then switch it to the macro after 7.5-rc1.

Just let me know if that sounds reasonable :)

Best Regards,
Ryan Brue

