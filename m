Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3391606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=laadxJr/;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bpZH+M2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=; b=laadxJr/SxN2Pr
	J2mXw9plSJHqRbwqOnBOaS4cQ83seHcbNRqVqDWivE3FIqcOEe+mwO9Zmn4E/fxfziP/WGYRWe5QB
	6SZoKMRv1a0GwaPceh0g2rz7KklygRPG6QUkTKx85SwHnD5bmPla9tWXF7AZE0nlC+0eZwHscVMQi
	+x11E57sRZm3HAdbmRQGqzMVSKylSzxBnJ4QLRC8wpz/8K+efncHk3z+4z5BLre+ItOczr0jCKF/x
	36ZLHvft/AdBzsSasaJbWR3vd5flPZp93H+cSiH9SiZ57J0cTWeHznXsj0TyEJBKLliuyUR7+uj9q
	cWdeS3+DYe06NItNgHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDSk-0000000A4O5-3evB;
	Wed, 25 Nov 2026 13:55:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDSi-0000000A4NX-3kgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:55:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so37710265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795614903; x=1796219703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=;
        b=bpZH+M2vE22T04MaVkB4z7zyiaXsvD9CukzwwOPsCNwWct6bl7EmRLNbbGYJKzZiMm
         TWXJ2ZLLHOP9egPmXOdTpnn+JH/geSr3cilSQCu3xsb/S1tYAAlme2sdGFU2xNAv9Tt2
         vUwQndCJKeWDHJQaT48jWDQANTcnzSl+qt+VhjEmTBBiCc9wDwKs9uu3gLPMML+d29uj
         BXwCM2Ipq34F1hB3SWcl3F0Xbouff3y1hDskdhPWs60Noe7wspAVLcoj/fwatIRgrS/9
         /DfwuK2ddK+PxeJXZ9OUgzewq5PWPq0oVVK5w4rNrVhQHGWiXB4g23w6OkVWiZ/m9LtG
         nQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614903; x=1796219703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=;
        b=dzeFgssyG1tbUuw64B+1QmbBXnvyId4bADJe/atskxcd8koLkXATc4omPOpz93xCXg
         jKJtj5pNP4Ljc2WVObj2X/D8sTFowQC5N7rS9+x5HDf1LQn9X8wow8RSbcv1NR8UutTL
         IIS+2I6DhDkQfYkFWaywQatcpH3fIp5sLBeXKCdGnNLCzx7evZHFQAlJN74GjzncAn/c
         a1FdhXjK9JD5tVD+BVcK5WINmJhZ012UH5FLpTyi0rONdf2fC7vQyYLoftcPNIlHnyxI
         KQpChe3RVmW7XOB2Zzl4flqzGZOp0e16crp3S7yM+jQdMVstvdxo588Gkh9PLnrywB6n
         OUFw==
X-Forwarded-Encrypted: i=1; AL+hErFBupx8fbhBzG8mFjcVEg+a3WNNAbsdsczaxx3/dSPpnjS2NpozayIVumS2qT9ONNo1M0/37ta1UYaQt/nTQydS@lists.infradead.org
X-Gm-Message-State: APuU4Z+F8vNtZKU2jGxvVbgVARII/tiyhlBTUakCwhPuy4MKUesck07h
	BFFTTujK997RlHVmSyMqes0IFbTgdkFoaKWF/Q4E1tX3k0e1YxvB3/p18QCcSnfdPqM=
X-Gm-Gg: AZFdTZc2A6jJFRLfV7G1/FmXehlq1FBN2T+Sotmc68XiK3dycx2ZpNFnTZx2qs0gNRN
	EeG77SJETdRyGq+B6UmJ+qRn1+taEX1NJWK53Y4mFiSl6abhQBu0UhjExtYvUfjPA/CwMeD7+7x
	wDyodatcgEFZSRO1YM07e0q3Mc+XoG7gmGiq2zFNF2DHjWp7jzYGi+3EH8dSgBgc5d60QHjc/tX
	S5Zhmu8qrId6Rov+I3iqzAnewfcNWFz+ipEZVSD1YduLWYNaR1RdopeOo1i5RtJMxRFltc907Fd
	lqeJni4w/qzx6r1MdqDX4Pruwoh++bNG93MfJ7joO969lydZ8/ZNyFsM/a5zXk8CyiKDeF82m/h
	MTZudJfxfJmVP5qPWIym6LDKVHVYFtPv3YgmweThh6KjM2P+HEj22F1UPPbxhIHSn+sBsrHD5HN
	RqtfsnIndNHl+J3EqWxDYHj6bigP4PlkSIK04vlgABVVJ4V04hvHSvFXGO2EtnDWs1mEaidxXgz
	IK7OWGxLsjsrd0+zVeuBXrJg9EYx0856RDOj8M8zvsi52RGzPk3k9G7zEOtqMGPlCUNJCOZ4AFK
	PjcDZtiHZCuQvG9MClpGJJhdCV/PYlzI9I7rQSQTFv+HlmDGB6wsV6At6O8SPco9xDus2FRniCU
	bge3frYfapiQ=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr359907805e9.0.1795614902892;
        Wed, 25 Nov 2026 05:55:02 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm515864135e9.5.2026.11.25.05.55.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:55:02 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: fabrice.gasnier@foss.st.com
Cc: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature sensor calibration
Date: Wed, 25 Nov 2026 14:55:00 +0100
Message-ID: <20261125135500.5306-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
References: <20261124202220.23721-1-gerard@teslabs.com> <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055504_941985_0E19B62F 
X-CRM114-Status: UNSURE (   9.96  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 13:56, Fabrice Gasnier wrote:
> The DT is deprecated and are going to be removed [1].
>
> [1] https://lore.kernel.org/linux-arm-kernel/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/
>
> So I'm not sure the dt-bindings update is useful.

Hi Fabrice,

Thanks, I wasn't aware of the removal. I'll drop the dtsi patch then.

The binding itself stays, as it covers the STM32MP1 ADCs too, and it is
used outside Linux: PebbleOS describes the STM32H747 with it, so the
temperature sensor calibration cells would still be useful there. Would
you be fine taking patch 1 alone? If so I'll send a v2 with just the
binding.

Best regards,
Gerard

