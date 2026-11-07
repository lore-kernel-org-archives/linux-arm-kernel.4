Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HdzWrolJ;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=az57Bq87
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nKkg05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=; b=HdzWrolJjSLNxVh1RVNRDNMHuB
	ZxQZSkAS+u5Xo0rC5TrtSR8z3F+uO1UbV7xqD4QU3bz0mmMY5RN6F1kG+kc8AxhWcIjDgd4s6gHLH
	/yWkbThKEkH5rJnUwt7she/l7fcZZnbN2S81V1lWoFWoNnfJ9iDEiDfeoazJKqFLN5oKFH8dUw0Am
	cBRJjgifk1rWZIHOTydUyW0b8iTVrcrVFxLsEGqdQ3iackgLPsKSrMHzhOI83As93nC+NdVAvPdJ5
	BI/V46vvLIAb3bmXEfDbKTM/bhEOwvbUh7aU/ISjO/I3Z+8x4pO0S9CfL93nwElxQslOlUg9jiaV7
	v7A1w0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh5E-0000000EnLj-07jF;
	Sat, 07 Nov 2026 14:07:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh5A-0000000EnKB-2fzr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nKkg
	05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=; b=az57Bq87c2CQgHhK/9n5
	8/YVmXgISKAdBBrBNKjBpPQGOPT6Dq8P7LYTUZ9IMpuqEStP4aR0ELTWFlvS2ovl
	9F2mtwlyWKl8t38l8cuz/lz6p+sL4MQAlnSX2A8B8oizEgeDtxerWNXWrW77QH2f
	5odvcHiCLmLHsrpFlqBj4X2Npf8pvw1wyB5AdzkqRipb6LonO2OM6LjETNeu1Me+
	J8ZBZlPZAmXo8QQHpKs8wFWEIPfY3fl8XUbheRPbGo+8cgoYeYtINzJIG0xYLf5M
	XzHmaMa3Z2FsRFWxyefVWO6kfIr7k9M93QYmS1tDHcKaUFLkcMdp30XkDCX7Phm5
	Xg==
Received: (qmail 2526305 invoked from network); 7 Nov 2026 15:07:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:07:44 +0100
X-UD-Smtp-Session: l3s3148p1@4+FpQLBfktwFFu4j
Date: Sat, 7 Nov 2026 16:07:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
Message-ID: <au8wq8Bqr4tZ8bj8@shikoro>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_060748_986498_91962EF0 
X-CRM114-Status: UNSURE (   7.45  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 10:24:56PM +0100, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
> t8103. Add "apple,t8142-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Same comment/question, as for T8140. Better via apple tree, or?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


