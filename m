Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA4606A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HyFo9ZEy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ck7VWRi3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=; b=HyFo9ZEyOO1aRc
	/aPjD5RprjgKkE+dJ2KE3vmbSzlgaLD+dRdFfGPJi47OSUjq5GSorKGpIQ87TEhDLme29C8FMzI+s
	xgca74f8SRVN3Hg6QwY1fSA1tsfNEwotrUbZbrU1lT24jEwBqENqIi89EsXnICPS+t17SzjfFojtx
	tiyn2DeU/grDU3jGUCAivoJa9R5hupSbby2Ohi2jW9wimX1g6QS70gj4lWAzLbBXw4oOK6RTmrQwO
	I6Px4FMYY1vBmcL860TFuJ1ALrzZ/Lnz9313RcFTCw6VKfXeugWSn7RJ1iV1QcEki66JxTytR678F
	2JP4WMxgafEY3sLUCSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIi-0000000BLat-0c0k;
	Fri, 13 Nov 2026 00:37:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIZ-0000000BLVD-0Ywl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-49a92144733so121521f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530265; x=1795135065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=;
        b=ck7VWRi3ShgjTS/ZCvWRgVh3UBz4iwXFunp5+l/XfCaZxDBl3BpVIB8pTDe9Lm/fi6
         nY3Fwkt9mKZQVlbwDaqGWJRI/a/aHs92v5DzUr/uGF518HcABuRnAdjaZYGX7wDJOiwS
         DC9xfQD4AJ3sq9skCkqfhg8Fs5JVQABOgiI4VDXUA7MmV8OIvr9QLiZOAgqUBXwWVNNx
         6MqGVKCRcCCpKRKJHqnI1XskltdxHxQmmNby4IgoAjJ4i8DkXBYUOxBIuZjav5M+UfeU
         S2OmG0XhCsK2HTEeheIf+aYN51o4YDtIxIwaOsKef5XpTq/6OcJvYPDe6W92HoJpuDy7
         0LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530265; x=1795135065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=;
        b=RieMjPlgXYo6PPHUAC0jG9ynYZQ3EmLQ1EVE/vbtYJzVvQfJjJflZGGKXuivpPKhqq
         4YE2TB71xl+2DtnhU0z9WS6erkAntvZLoe9/twTkzk1s42gchxayNVvagTCq8rGnDdS3
         itqemlzam71aK7QNVMf2xTf5g0V8HPNqHdicVJigSTepy2Cjd4olhNl57YFQ5vSkSMjX
         b3ID/5gxzXwb5maghGIJ2AGlQuSD73v0PkNQ1e3mVGwTjmxzYDpM3FkqLaASKLgzQsOR
         o7G27qdQ159/8NZU6BbQ6ry35ln6+IapqDnA7QnEKIKpJV+LysoDveIEOeK9GZrKurQ0
         gZ8w==
X-Gm-Message-State: APuU4Z8VLTwt4f602o7Ze3QG7UUFHbi950wKMZNrYxi1Gh6OkiF6vNgb
	pbs+J6TKQbKMcUuKsgCMsqDS2bfZfXcWXmbwsUVG/n6yCjK9nob7qNw3
X-Gm-Gg: AYBFou1JZw7k6O8zAkz2z8OUULSe7IeMeH3KYNfD+lTTh5N6w9tbAR5GzvgxFferggr
	if5rF4kQ0qH9mCEtOjnK3RD8cy0CT5kYHsAb70rfKm8ih5iw1PgKMZgsseh8QfA4ZBMisptanss
	whQ3Gbx1Pu78GF0qgzlCd2E1k1HqSE9+LejJIF21TF/FW6xNPB3PFzQtCwjjD4nWcFgeI9jiufn
	s0qAOreWok15YN/Te2cqRr5twZdedF9+8AYUVE20j6pu+xTllypRSN4SCCPeXpDX9TyyqfZZFuM
	RZEG9RcEXxRVM19P3fldgcz/Jq0BJbgNdzJuKR31Ap28AEXMwKyPFcABjPiUp9Wnx82r5TqrXH+
	gaCYpP2inAD4R3L6xMcaaOY5OsXEgdCL3OCHLwvq0+R+h5nWSp9lNqRy82FiCHNQAlKwsfaaFrm
	XT3Zju3Nxjd98PR3zYUPKm4BISI6FaxeY9oDFXbIPvGkTrtjVHas6sjD1pW22o94H4jPCSBh4GV
	o10NM6eoGyfzz0BRvbtGrDjroxA8tqu2f4QJL/81vtXS1+cn25icOPFz7A7jmv4kva9ZgNVK7sI
	JVdkEM79+0EA1sLsJjaMgZNHVFvqDBFt7YwjX364v2MksBBDT17bKSNc/UbQuwu6HXQTfEi73b6
	6DccJZzkLw0RR41bYIsOEOfKEemnadD7H03iXPb6ZE1iqn6LRBc9VGn+kgI3d5pWPFJnhpMi81t
	hfjI0uRSJDFiMvWBSQ
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr2038948f8f.55.1794530265593;
        Thu, 12 Nov 2026 16:37:45 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm2183440f8f.8.2026.11.12.16.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:45 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Fri, 13 Nov 2026 00:37:44 +0000
Message-ID: <20261113003744.3668464-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-large-mayfly-of-blizzard-bffef6@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-21-ghahramani.navid@gmail.com> <20261015-large-mayfly-of-blizzard-bffef6@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163747_186792_306B24ED 
X-CRM114-Status: UNSURE (   7.83  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> Drop such messages from all your code.

I am dropping the SPI driver from my series since Stefan will submit a
driver. I checked the rest of my patches and none of them prints such a
message now.

Best regards,
Navid

