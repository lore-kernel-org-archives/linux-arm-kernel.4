Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B95606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jILkXKRg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+9yl8Dr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=; b=jILkXKRgMX8MCcB4MP5K9M5/uk
	JfQKnwK8/rQekfV333LliULHHP4XV0nnO8Hxy1teendvmhxE1ssaKFDfoKnCpHPv1V3Bddgniy1Nl
	0wxIiDpuY52tHUNMUI9tJ8GAGXFyAgxVq430REBqsXQjUytFA5wxLOlOUP0kTtsOeIZ9f5WEt3gS9
	3YomouBaPuvi9A/GO4k7D+WwnIUQjoAXH4hJkQEf19bUmapE9syjAzrwgsROoDWvB8uiqWqTj3Gyi
	BwgGesM8fIDodxekkppF28lqvgpJtLB8D7m5AbNVMzRWaEbpipYDe1VZoRfFfqFm1sbLJD7iBD2vj
	CO+nCd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlYp-0000000Elpk-0Te3;
	Fri, 27 Nov 2026 02:19:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlYm-0000000Elp1-1pmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:19:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cdb684859cbso4452828a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745975; x=1796350775; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=J+9yl8DrEu5vfv+Tev/LIOCsC03nDTuhEmkDQATZvhMDphK6RVaPOx8lx7+ozjzUGa
         //LWyD+B8dXG9iz9sOgqST3gsY1xgkX7qkzQXBoHtC6UwrEHTvSzTBbOAYeSjIJERt4I
         jnrlOdiiXCDT76CuDu96UuQojbdXPZA2whqu0BgEifQlD4Y8o9f4M3S1q5REwXd8tByA
         mik+3HY40oM5NPBHt5oECW/zqtCMrONir+t38g1QsETJ2fYdqa0gjqMi/cEpczGQCsBT
         0Y8iliWyVk4gs5BLR4KwmGg7vSt1dUzpxTHcTLZY+BwGwHLrRj6h76CX+PI1Frmzu6J9
         LKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745975; x=1796350775;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=wUtNUwY9Q3vEIX30Ym6Vb1m9d52T6mjEDogxJSuHIFzdywlBbsSPPJzlvPeygk82Uu
         ddFlrQafSrm4EFKjAU+nFl0vOk3JXZ6HdpBkbMGUfbMdjSCFaokpsVkCM98cogdLXcOg
         aZeRh2Y9BOTe2QHjGTrOuj6fMXCAW+MMeNxOcN6DQYl6a3hblg+oEHAId3bpJUG7+dUF
         yWld6GV4FTovdAJHoxPm1qEdFp2160YEOdcLX1VRfI3wsRhV20W/y+z9QQrYqX2xkv/A
         7tQlNsupEqmwf5HV0NLPbYEsFbUESustsYeXmf1Jvjn8tUVuVeufbHcwHHWb910/JQLz
         7A1A==
X-Forwarded-Encrypted: i=1; AL+hErHH84lxyO5miqkg5JeuEaXTGPiJixqUZSsl7etuAW3s8Ppzy9qXmEnsO7uEpPUcGB+PIbXgv7/TxGNhplh+3YCz@lists.infradead.org
X-Gm-Message-State: APuU4Z82jElHDyeujQJJSnggKurQtKo5UBwpWlsBToS1nDgWPMStaiNW
	YBQnJQGsh6wOrqVwdeclNvyXbFR9jxvjKQdtcBTnvCQo13EmDwFVUcDQ
X-Gm-Gg: AZFdTZeHcfBlnDYObT+gYniGKGQGIBheuBhP2tuYmtwgDjS2ORsnUjBoA6RWlsBMacy
	mXjrxuTLLRIyIq/87236l3KYi6kjsEZ0y2WaBfA7nn5+oA+KHfc1XyD0vJghbgWH2hffKCVLiuU
	hSj4UxQiQ4IvmF3nbyGuKnGlFb9EmOV08mISbxC71AhAsNXcOcZp2hKPy4r4NRa0N+7BLZmjlPi
	ZKTqElzFp9acxeKFw5tdvUReFZasxp3GeLbev6nPG7kf7Y3z5zRmLoXrBUYCXhtZWmdBrge4GKG
	9JSsAyB9j4Zb9Zb1wYhyH+Lqwbrr7zElI2hlDpAeSgM2PP7iCOSCDZSm7P9eKdK/xObUVmbPnVd
	0kEwsN4NSJJxhGYn4hS7BCr37KG9JWNWmkMwOasejuB3saXCUb7NTf+KH80HxrWCgELguT0VAxQ
	hFw3eKnApfji5xHsSJl4MmM/HSTxl2+RSrxPR5nYPjsSx6mClBylj/b87EEU3JCe+edvYB7rwfB
	2O5JIYv0jBCzr2qo/4VWV5iodGpXUBDmgwench9/WPXgZXf+Vf+4Q3yNawefKwBOoXlIG3QauVu
	3x99wi5ekDyxE8/gqbkxEVUqxyP5ok4nJsCCTZMpDCOnYc6J7i0LDKt0JMzeULFL294BH/AeLnk
	=
X-Received: by 2002:a17:90b:4e83:b0:3b3:ff70:4d06 with SMTP id 98e67ed59e1d1-3b41c9b324emr21488621a91.16.1795745975421;
        Thu, 26 Nov 2026 18:19:35 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm37964315a91.11.2026.11.26.18.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:19:34 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iio: adc: mt6359: divide scale by ADC resolution
In-Reply-To: <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-2-iasnezhkov@gmail.com> <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:19:29 +0800
Message-ID: <179574596911.3233.3328617859832706425@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_181936_504007_FC3C718C 
X-CRM114-Status: UNSURE (   5.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Sorry for missing your series and for respinning v2 too quickly — both
were my mistakes. I checked my other submitted series on lore and
confirmed no other duplicates, and I will give reviewers more time before
respinning going forward.

I will drop patch 1/3 in favor of your series and send a rebased v3 with
only the remaining fix.

Best regards,
Ilia

