Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F37606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 01:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3x3kPaD6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZHXnx82
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=; b=3x3kPaD6benPYP
	5/kCplSEPTg4x2lWLP4CeVi3SzS0t/DRZMRaCyjaftdn0EBsb+vvq+DQ+jGrbt8BVXlsTSAiP1YJ8
	9qCjmyTil9D/J/VbDgAu4Ssc+TUTgIfgoS3cuKA79mELcMuKyWedCjOCo7qDD/NMRZda0VHJhiIaq
	rAckpzHlJ0p/A0eAeOkNSSJyY0rJpE817tBjZkcafkwCo542tHsgOCaAbzzdHcI12uuaBtSR6KxJz
	Nlb3WlwH8PN1UT64pSrSLMolKnedTNG3NMu2B4ZL+SZ3Id+jiSb6QuujI58pm59qtRa/vk9TN0EPl
	apelhFBrbEP+HBdstQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW20B-00000008CfU-1gTF;
	Wed, 25 Nov 2026 01:40:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW208-00000008Cez-3lq0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 01:40:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f03920c477so44067745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570848; x=1796175648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=HZHXnx82dwxCqqTAMyL6iIGRWw3r1oQYp8vNHtBGXKCuRYDHLuSMifQ1lK04wubto4
         jfUWR7T03aGlED74QZZvBibFPqyoOKsP5ZxE5Liu9zufq8AzPsG80WVsKTULr+bNArrg
         vcD/jhYwVWFNt5SzuXlJ31xp0q0fhSf9plB+9uyRAdqgMs+oPSXLnkhnnhfXNDF3Vwzk
         RiKEP/Hda1EKlvntHmTYf00oYaw840CSwiK+yXILb+zdCGDGp2RVPSCsFsAIwFJKtxhz
         Xy2WlyE6AtiZhnVhH3lCBHC2KW9H+3B7V7k/I5kG4bMu6CYzEBvQnnZCvPWaQaZHJ55a
         RHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570848; x=1796175648;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=S5rCw7f5FysXUyJvSuqONI2ItQP4DRtlPe3N4wyGa+ES5511yn8ShFqHcAWZvdUsa+
         uMOs5JpzLiciDzSEB55GBEjAj8CTMHDw/qQqjU6hsGP7ew9/bi2GTB1q3GOVYf6zqvBE
         KbqFPam3mor5DC9mUUYAEcfGm2f7jTtJQPTl1Xn8H0W5xAXsGC5Ic9oXvnEAOqVZaKPr
         LfEKujlifOnUITgnw7iWp/y/ZheauWGoY3YjRQDToE3ODaUOhPlCXMOPJStok091btMh
         fYSwlJ0tGiSKYV12bkxPad9GuqE4hcC8XdNfvjiy8m5N8m2tPwqQ/3E57F+iaIuve3lL
         pToQ==
X-Forwarded-Encrypted: i=1; AL+hErGiC2nnLb0LTPvy5/wDTvF0iRNvFQ/R8WyxDKc7VZ1LQBlT44HsUgT2CXbVndDdUVuzDEqMHOu1AqNwuuwhBKmy@lists.infradead.org
X-Gm-Message-State: APuU4Z8NlRLSq+KIU+nuBS43z1wl7kfxsmyJM2LC08fL3/yEhwZ0Fk8l
	Fj/ciOx86iPioRErCif+HY0FCrBEkib6o2E3hT1PX8M7K9tZ689ZATyx
X-Gm-Gg: AZFdTZd9ufNDssvOCsTL7eefLYzm6bV6pZz2+6/uwnGmZn+DHrHjO97ruycTOAkaImS
	Xbh8ROujhAEY3xpz6aXip6GVX9RX8PvP26zCK3FpW0OYTtRbkeCCoq1YDM7rayEAFST/X9p2q3B
	xvn5164ag2bthJhP74YH3ikLEMeOxvIZB6kUJLX2JOB8HF5QcmITKE0QELrEBEhqeJkVbDf4VIO
	j/weAMHFIvTYOhIIpJvCAQkXzc6T9yPo5f7QsRkCyJM9c5SP0YCIltZvMvMx30Cj9p+cXFDHEjW
	C+X7JDu5g7AFtBTLLrlEXKCpUVMZYlfuZMZfgK2DWDJLp4Ep40JibKbWucQsK0HhSBiyYvUaR6Y
	dJVb4vUV08/CvSt1vqDleq22TjxnonVoTVlmTI0PeCGTK4tekRc7bEJe0hqbiy2HAgFxc/s7SlD
	1VTAgTCDfn52IU3Tw+bUvOS5S7sMv6IEN25iefhDR6+ZlhVN5f15vr8M9gnFZPCevpv5h5VdS6r
	sK+jeECBY0Y0n8k4PzOb60AFFsRPk8Gqo8CDwP3qVRIWMePWIcITWOq7Xv16Dks5oqzNrvDuo+D
	hhYZx4LtyV2E/7RaheyH/xWWzABBnFpF7Yv48ts0PoCS5kZpf09UK6kO1ZJ3rKFjTkMlreutJof
	LtF4L
X-Received: by 2002:a17:90b:4acc:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3b41c9e4b1amr15908819a91.30.1795570847756;
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm8761791a91.5.2026.11.24.17.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Message-ID: <8c25cc7f-5c8f-4bb7-b82f-0f2d1933e334@gmail.com>
Date: Wed, 25 Nov 2026 09:40:43 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-3-cwweng.linux@gmail.com>
 <sashiko-outbox-218423@kernel.org>
Content-Language: en-US
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <sashiko-outbox-218423@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_174048_944250_8D5CA63A 
X-CRM114-Status: UNSURE (   8.57  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan, Rob,

Following Jonathan's earlier comment and the Sashiko review about the 
internal VBAT channel, I'd like to clarify the intended IIO channel 
numbering.

The current driver only supports external channels 0-7. The internal 
VBAT input is not supported yet and does not require a DT child node.

Would it make sense to reserve IIO channel specifier 8 for VBAT in the 
binding, while keeping #io-channel-cells = <1>?

External channel specifiers 0-7 would continue to refer to the 
corresponding child node reg values. VBAT would use specifier 8 without 
a child node once driver support is added.

The current binding also requires at least one external channel child 
node, so a VBAT-only configuration would remain unsupported for now.

Would you prefer to document the reserved VBAT specifier in v6, or leave 
the binding unchanged until VBAT support is implemented?

Thanks,
Chi-Wen


