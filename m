Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271AF606D002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2S3Efpjn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KssVo+Za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=; b=2S3EfpjnFIUdtA
	9quJ8S9sjSuqtTDmTJDqFqwVpNqF1v/HEiezhLh5rxubNu5w6GfRfZA1SGEYvh3EkV5/Z58x2YQlR
	1IMgaFBGVFrq3gywED+jFGyGgPbeXvnM92KMolecPkj8pMvb+HSR8aH08hq/FYLMvlRQLywmrdnVZ
	IoaDzqDLzFIW6I3ld7VTouQeAuM2eEnuVklAxvLeOq+ksoQbJqWieCogUVPvUtwwJ+13F5K7m/JwP
	MWiWTZTj9xynB782dwJPVqyOMoKMD4guIIhj1YoQLIb49f3uWScfdq+4aysMs+7kMvwo/QIsXXoJZ
	Q0YXicLLHTKrylvvBQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhG3-000000037wB-3XGm;
	Tue, 10 Nov 2026 08:31:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhG0-000000037uc-0Wus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794299464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
	b=KssVo+ZaJ7rLj0MPnEMu3Fbeaq2N1FMfjXGHBOvvG0TKDI/D9eWAg6Xsn4rOqMk5m96MJ4
	abyHI0N1t9nSae4nALFn1oRLWJgCTI0Gn5H0WpxtLk/LZeQJtp3a4cRXHQfSE28ZstiCos
	8147xRtqW01MUTxiMHtTSMZERTCCBUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-3IKks4JvNqCVjx5Owj_yCA-1; Tue, 10 Nov 2026 03:31:02 -0500
X-MC-Unique: 3IKks4JvNqCVjx5Owj_yCA-1
X-Mimecast-MFC-AGG-ID: 3IKks4JvNqCVjx5Owj_yCA_1794299461
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so16274315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299461; x=1794904261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
        b=LqGg5VuL2MiKWAMuZtPJmG5O+7gH4IsVaLdHQ1IlJ5wfdnX7n6Ko1vtN4rWFGLyVtX
         iDqaG581DDsQva5OOZdLWMQ+BUHNFTJuRgrA1SAcSVjb4EvQ0fXHcaek50xA575P8Hy/
         mPhtNngLoHYV7EqX2ZlkmA3awoMiO2QK6cmYz+IM56+bi5Kg4HE4KvCL2wvWWdZH3vpA
         b54RjBidvViP3u1WU1ckJVLBCUaQd67zpjhyBeZ8svJBU10G2y8tTAinScJrRe+3VN7t
         UEaJVnH6wuqOsfAT7uYvzfKe9QLlJLBYG3zFvgAvpDfZM2NPPPHl/MeBF84gihjBkAaY
         nR/w==
X-Forwarded-Encrypted: i=1; AL+hErF5PYjGVBsmGXD80i4YlxBGvNT0Su6haBsjBQRNJAPBDr8ujDfMBYG5KOKpn/bljNyf+9SJfxJWg+/wHBkale+z@lists.infradead.org
X-Gm-Message-State: APuU4Z/3Ql2GGwC2E7YOTM3GY7Ov8EAPhQB4Wxk1jNPuHD3G+ujx93gj
	xd2A0/3EaIAr6Iq3hnjTtWbKUMVDbxP4RXpifRnwK+05BD5tyUUj7Ri8M0+UlKBT8eE2yLgp3Rk
	tWAUBzuYa3bWQ8V1XFRim4kw5U18L4B7g/bmKnb9fAPwA87tdnUphRRlG5ZMcd9wXTGdWt3loLY
	d7
X-Gm-Gg: AYBFou15/Oj3zjmbjIeKEt2E2lOkVKt6Ckvv5UveANdP3HcIP/YED/yx3BW6Qa9s3xl
	dXF0ooVs28iXfvfIiwI7Yg+WQ65LPGKX24tL0bWQRw2siE/RPAFMrkPhpy3+1096Hp+V/oTClXS
	ziev5RrYR0eUuYlgghlaW1MWJ+1FT1UGwQQkdot1bdxqaZnqQXy6CnU1v/OZxSI5+B3S6knRty2
	J7Avof6OEO+fgPODtC1ZtspHeXEpQovpVuc8NDpTf1Gzg4cPJS1v1I53xJ0SpE+G/uW0FrRuatx
	fxtc1IEkXOposT9OyAZV9V9TDqYLUtPPrcWoDZT/zt0WrgL/sB+4xgKcUqrmuzPwsUqG5JiXJbq
	4N+zntojsAdH4SEwYueQRE5bFMQ066H+bLJh1ELF1/Fan7+TQrJ5rpC7UE2vOq3sd/Dlaw63ryc
	K1ryOlkCPx9WDCAEOQVlsOCvpTxxPAmHWK517TJ3gfG6+3
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr37428075e9.22.1794299461241;
        Tue, 10 Nov 2026 00:31:01 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr37427425e9.22.1794299460813;
        Tue, 10 Nov 2026 00:31:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm44017445e9.12.2026.11.10.00.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 00:31:00 -0800 (PST)
Message-ID: <817d2bd1-64fa-4a6f-bec6-5a4dd4d3a76f@redhat.com>
Date: Tue, 10 Nov 2026 09:30:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: Magnus Leatti <magnusleatti@kernelriot.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
 <179379704484.488856.2140619507341432623@kernel.org>
 <20261107100140.8279-1-magnusleatti@kernelriot.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261107100140.8279-1-magnusleatti@kernelriot.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6fE7Mu-PNCaAzNTfNfUxQkW6U6MDAjGHwbjDN5annT8_1794299461
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_003108_243761_E896C9BF 
X-CRM114-Status: GOOD (  13.11  )
X-Spam-Score: -2.8 (--)
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

On 11/7/26 11:01, Magnus Leatti wrote:
>> Should the Fixes: tag point at 1b9707e6f1a9 instead, or also include it?
>> As written, stable may backport this to 5.13+ trees that cannot hit these
>> storms.
> 
> A data point for the RBU case from the YT6801, same 64-byte UDP RX
> flood, all on the same 7.0.13 kernel:
> 
>    stmmac from 7.0.13 (has 6ccf12ae111e, not 1b9707e6f1a9):
>      no storm; the MAC interrupt never fires (4 streams for 10 s,
>      and 8 streams plus TX for 30 s)
>    stmmac from 7.2.11, built for 7.0.13:
>      storm, the machine hangs
>    the same, with only 1b9707e6f1a9 reverted:
>      no storm
> 
> So on this hardware the RBU storm needs 1b9707e6f1a9. I did not test
> the RPS case.
> 
>> Since RBU and RPS were enabled only for statistics, was masking them in
>> multi-MSI mode considered as an alternative?

AFAICS 'statistics' here means accounting of some corner cases errors. I
guess this could be a preferable route.

/P


