Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BDD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+rsZ4zb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LirhC5eM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=; b=e+rsZ4zbmyjfFr
	wtxdUeNgDTGv9IIrM5KHizICKPA4hvF0v+bsvGUm3pl9nYGic3MHYMBpacDYmsWGbHrXxU7DHx2dH
	hZB6dE/q3Y8/zNSM+LRlkgLCtmd35gdWsxFs23xDzCm9ZyCXz8Yib3np0T1i6PVzOzl8AcD7x9WtD
	jbhBIF6MPedyDw3MAK8WY/YcClJ9mMn4rOqPTFKinY8eATaKlbGyJWVHS3rorepsMQHjyDlWOI4Im
	cQefCbsz/uimDtrEXE9xZNJBsLRrRiNUeqfmc2h0BILfROiT62DQ5hyyn20GzizPVae8r6LuXe9Hx
	cOcS0O0GNF1utB0ScVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcU7-0000000EPJs-35pM;
	Sat, 07 Nov 2026 09:13:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcU5-0000000EPJ3-0PIA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 09:13:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso2049a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794042791; x=1794647591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=LirhC5eMfpFULQE6YLZwMtyFjhBSWf/O9bcDC1UlA5ScqMO4M9gaARYMPDslZa0XkF
         GdqU06RAEEOuCv8AqLlFc4pq4VW/XaaG99mtj8ddIb5+zY/6K7vpgadjsuqQpYMRUmkx
         8Wn3oySdjbTCzHErBqdvpICdjzo+PajbtTbbyywQR/n01b98hDBnw6SX0TbyGYasan3n
         /bgzNL2VMNpV4bjOWh8bWPOGf1IL2D/iApuYKKfWwDOkBx6k2wFeYqkI4uC51JVLOSFt
         F7sQt0hRpyCHFGOMSKJQo3wV25A/J0jPkiH0PdixeOjUerN2CMAY/JL0uaHrNICFCmGI
         D0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794042791; x=1794647591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=NlKAW50/JyJ2Q8A1Mm1iD69dyag5OYyEEcvM8nqVWnIlGZt1TZv7Qq89pezVCiCIcX
         xuD8QKvf6un2Frp7+olA9YQ7p5IUp8QsVqwJByy0lnozFNQRrc3ygr9TI+QL1O1uxP4w
         wze0Z5tVIyoLj7yr3Om8wMjnflJYLpftTf5hW5iZ2JnTUe2GtI3BgevRlVsc/DV0tjiI
         AnccEtEmyghv/zZ5HMyr/YiO6GGsXSssB22yxEXxwUc9NflX6KxPTveQ86kgP7nCJp4e
         /Ti4kUxHT4BBrIMeSyQGtplrFWpcnKHz+Utqb6zncKRID4QEXUnuX/sambHqc8Px6msM
         46PA==
X-Forwarded-Encrypted: i=1; AL+hErEWce8mQXxf5d28n/G1Nur1X7XvSDhPsyvCu8fk2X59GBizN4ysjDPW98TJby2VSXzpWumRgtq6IkZSb9Uvw18L@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y5KTVyKhq60dcZ7gRmo5c+t4FCk/bymGD1tT4jMIkKc7yJz0d
	oDrcF3PenGItzeesZlS3AgVeLMAGJBsbeleduQiNkZXzS92+RPKLykYc
X-Gm-Gg: AYBFou3PhXiEylYa6usZyFClkddjaOW/ko3358u4BIQb9zUdFqJnZB37zmHnN3+cgqR
	XlMFpFbv4GvUQ1geoV1u/HmHPiB9JU35pDxaCJi1COT9O4bEjwbjQDj4mCdS//g1LG8wQoW2Aqx
	82eVYA3j1v9Lv0LN61sdOBSot4rfO/aKo0z0bpF35BaPg4Uvf8/2Pa/kTqFx6S8XvtNnxTSrvSv
	K4epk8BMGj6QLoJryGBaVPgXstWzyrKzZnmQwojTcscH/khKraRimy1OsfOJM3mrv5u9GDtRNCV
	mwPYop3Q6EneiroRRGCv7kkzczb0GnJBc4PV0mu08YVFzgdFKNhljCgMLIqFvS0HKgWiiglXC4C
	BshE5MaAL4hnWya5g7k1LBl+1MpQLxv5pw3O5M6bzEQRKFTREzqYSQAw5M9QbWCvtRcL9hfwJbk
	l0Ul5WjryMfJYaUvsn1jwQcmZdZ9bOkFBTEsZP8S6x/nyYRnj+w3LETwAVCLfgbRF2xsklUuL6y
	4Bt2m2sP29WVSt3PG6K7/7fJZyBY7IfRWLvJKEQ9GMTA16Jdpp0PWgBvTg7QpAZXqVY7RKx4bJp
	va6fh12z2swsB24CCbZHev50Jl6iRSAJyxD2lsPQnXwyQTJTgQ==
X-Received: by 2002:aa7:c3cb:0:b0:6b3:c422:9257 with SMTP id 4fb4d7f45d1cf-6b597805d85mr2374834a12.25.1794042790711;
        Sat, 07 Nov 2026 01:13:10 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b6e82bc5d7sm1405043a12.13.2026.11.07.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:13:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	Roman Vivchar <rva333@protonmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Sat,  7 Nov 2026 12:13:02 +0300
Message-ID: <20261107091302.16545-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <au7UMdlP9O6oo41i@buffalo-ssd>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_011313_206146_1F75136A 
X-CRM114-Status: GOOD (  10.60  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akari,
(Resending as plain text, the lists rejected my previous reply because
it had an HTML part. Sorry for the duplicate.)

On Sat, Nov 07, 2026 at 08:18 AM, Akari Tsuyukusa wrote:
> Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
> "mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
> once the actual reset layout has been confirmed.

Thanks for the explanation, I missed that the mt6589 entry now
registers a reset controller. I'll make mediatek,mt6895-wdt a
standalone compatible in v2 and add a driver match entry for it without
reset data.

I'll wait for comments on the rest of the series before sending v2.

Best regards,
Alexander

