Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kamt2HxN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrPgJPGz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=; b=Kamt2HxNWbnZFPgChy+R3VU1UE
	8789bsvC6tIECVz+6giY+Lz0LO3qfDq/O/8nrovkte5AVvlM9Eh5WqDXQNMkThUGRKhrN+e8xyHTT
	QNm/WjLCMBa+Kd9qojNsOQaSKOWKukt/CwXVwMCz1IXD/1++l3OfkIui95L/A8TZXXdi/DaRQ/0Sg
	sSfNmIfQkeKy9LsLKnxmO9SYlL4kkhumeRnf7hPnhGG2Uadu/0xFM0VNi2idCZhFWlfGSabhnZ+EY
	VgwxFcpo4u0S6jAypWHq4gxo3jJtw5qqgowaYuIpgmQGM1+zc6U1JuMhRsCEolXy1K2Ho6VmTNIrp
	O+3bPZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7p-00000009cWm-4A7s;
	Wed, 25 Nov 2026 11:25:22 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7g-00000009cLV-3nrF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:25:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso44100141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605910; x=1796210710; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=RrPgJPGz7smptmMgf+NxGeiRX2DfDNWp0K5y+yEFuDNZO5R1dG4G1GViWZebn9VaO8
         OGLzS4Q3Pf3FeGY3vlyaTT7onL+hCeZuR6e4lwPKBS62UewQkeM3arCzcSVpwZPI7jA4
         snWa2S+8cI/pHAcmkkDgca+JkRSm9SllBptHaCOh1XxqDeAxMbzCxAXUipKw5E/dl3GT
         8lSJ3Rn6Ffxl2SzUUzYlSLGd1ud3On7E3lH5yVKBzLAnyQGTMt5WGOu5NyiBywuGCA2w
         7EMMiUJ9+LlMB2SHOURX4+48P73mzxPplZ0SRdCfwYbcYXq3Jh5al9UOvhQ4FlbpnsmY
         7qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605910; x=1796210710;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=l7kmLt75RVxfVRuoRxsniTje8kQeosi8T4HsZpUuZRWFza1Yb0/jIAC3WlG4Lhes9G
         q8khsJCRoJVBuZXnZX9x8i13cGJniGpoI4POjTcVnL4v+xJFZfrjW/DeR0RuffXOkjBA
         QBpvuOkUv+sNS8Nkde7TM8GPJbcpm79i5oPylaT6Rpn7p9efJpKodWfwbbS4KYR7jyX5
         N71EdPsEVEzAoxYnhM1pdLCQtSNDsBvN4RhmRILLK7FW2iZixqIlNgc/j+5yyViMQdJg
         3DyI74FgEOwOwb4JyBH3GeMCrPWcvlKWY8wIwr3AM9Tx/YJNAwL/T3KkciMGpu94QOSd
         9F1g==
X-Forwarded-Encrypted: i=1; AL+hErG/RFp4N0EsdlCTkeQVY3ansb8TIo+IyMUaytUtG9tXWOt1XOFs7HGV27WdqcuVMu/GjQjTsqcK0yl7NQ9XMjLP@lists.infradead.org
X-Gm-Message-State: APuU4Z9H3Nor01tc/d6MWNMPACpuPiIH4u5Z/los7CDUVtKt1nq3ANKv
	A8OJRmeQ3xp4s9x4w5vwxoBCT1Ha2Wec7FvKnfpoHEK4BXxYgTtSQmtq
X-Gm-Gg: AZFdTZdkcBVZaHyZPcaWTrLjXMZCnLbNzF3VqshK6RFVme5Bd6dBKIxIMp9RcqV9Y5G
	fHmbzDi1SPTpw/KT27uVi7QGUitT32x7qGDKvH33hrd+Kl1U9DGYl5WB2v7c+wASPFTomqnu9hi
	C3QnowYGXzAR2PW6Lrj3LY9s1jqhOIwjTFZkVYMRO8L/Whd1mWCJlzYyQWo9G+Y8MAlHEwGFXNa
	ZvQ9PkrPf7lylw65w1I1dKUrxnTy5xDG79/qA19sEkzgZW2NY7umvBv73g3AOXHaFblo+S3XK6l
	VzW9IawSnJteWazX2AfKrpEtDsrRFJw2qelGSoKATP0p9JGwacgNmd/NekIM3tIMo5ucYj2C2ri
	zbiIGOis6Evv20Xtu94ga6gti2Is7sc0HIubVqjANS6hKRyEXmOqrNcHnNHtCWD2Y89r1kXkgH2
	AumHJ/cqd6TiIXdHhXJo8pw0kNXD0cI6uG9e1Q4g5UaI+c2A6AAPc9qBkkcHfe+HTwSXIv5SHp0
	+O+EaKuL9XwNyNt7isPHqosLuM0WmD0nxdwup4kv+FAY+pAgExBwvYbCBY8ID6+0KOdi2u5sdm9
	WW9w2/5C1QHu/orq2ejkpoKzKU21ooIdI18q9oLOyLqoekIMFlJtEKiHScMRp6VbIBkqGkWEFZu
	c
X-Received: by 2002:a05:651c:419a:b0:3ac:8a38:130e with SMTP id 38308e7fff4ca-3ae7fa692d5mr46457601fa.21.1795605909904;
        Wed, 25 Nov 2026 03:25:09 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee572sm45958281fa.10.2026.11.25.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:25:08 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network datapath
Date: Wed, 25 Nov 2026 14:24:53 +0300
Message-ID: <179560589359.3.5378747793444153378@gmail.com>
In-Reply-To: <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
 <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032513_025935_44D531AE 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Philipp,

Thanks for the review. I'll drop the RESET_CONTROLLER select and both
status loops. The provider polls each of the seven reset bits on assert
and deassert and propagates a timeout or register access error.

The individual asserts matter during teardown, when the hardware may
still own DMA buffers. For example, if the QM assertion fails, bulk
assert would release NI, FE, TM and SCH again and skip DMA and XRAM.
I'll keep trying every line and leave successful assertions in place.
Any error keeps the active DMA mappings pinned. On bring-up I can use
reset_control_bulk_deassert() for the reverse order.

The 100 us hold was a conservative delay I added during bring-up. I
don't have a documented minimum for it. Cortina's BHR4 U-Boot toggles
the global NI reset bit without a delay, but that sequence covers only
NI. I'll test probe and rebind on the Almond+ with the delay removed.

Thanks,
Fil

