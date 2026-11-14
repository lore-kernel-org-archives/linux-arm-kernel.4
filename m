Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fy90kUMt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCcLye78
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=; b=Fy90kUMtziNHCU
	1Er+dei1JHuA9sINr+BJZ4Jj/+k+4QkTB2DS7LIBTsyn7k9jGiMpkczypNoSk3n5B8euEb/HkT1yF
	4cJP0K+QlGoyPynI2hfXCsiizVw3mnvwtNAv6I/ZfLvOoJNBcxN4XTgSt+PBkJtavbui0D4Dn5uul
	ILIzyqYr5ZhcXkhrALoyM9izxQj4p7BxgSmsv6cnvThTDJ3ltHacqOD/IJlsOhYWROiJK+aZWQGIM
	RngMNWK1uNeMHmhPZiNmGJjQpWft+WtXaKWfgk5bzDZlhhwNZnGbYcmphHyvMOI0aKp7Gpeey31jB
	fg6G5YipGN6zGV+nTTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLKo-0000000Gn32-1dik;
	Sat, 14 Nov 2026 21:30:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLKj-0000000Gn0G-0yY6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 21:30:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22067705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=tCcLye786ePySNMg+LRBBAa2F8BZawn1gjJ7MrdKwRkl6lMxeJjZ+mkGojtpC39KSD
         M/TJmsNSaUnZAsH5Ppzl54qJ6Met1Zo1YIepDz6pst43+UpjE7gmnE5qZ0XAS/TRufYI
         nsKfGhJ1ho7MEt+hp2uKv1yt+zhjhbUnmapbyEKn72Q4nBUshqXIi2PpNwwlc3chSLay
         LP1XwefJAGRuj1Nc9mfcY4tPRXAoJoTvsUz1RZPjYAW9PPPhNvTkrOps5nC0fU6brEeJ
         ZR4WnUfVoznBntrwplLxUEHwOKOppNb9x+kHJq4vb80Xz8tFtEII71g68SKL6dFUsaxH
         eD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=fwGtCs9bpbWu8QxQKGGhJ74KNsupIAqFjbR4uasFG7jDsnWOwXOSedHgxKNxPLZx+2
         J7a29lt0EaaPID73miCIGz8b0fBMnul3UhDZ0MqSTNbWJhpiORSGYGIdR5Y9j6yZ+jC5
         W72d5S/7QiV+KqFgErgDb9QbXlLAXn07ManL+DqYp9zSafDLh6eyhYCpvfl95wxVEzIl
         srspymdOMMuStUb3S1c7nwyWe5ZkStPQeuCEDxsQHcCa4TUmu+Pg3mVOQh7QXiT3S93l
         nuZGHQrXUQEXyI1I7W6toGIkDcQILlOLVSoksIWtmKZpiakHANb0H6gzuXHcuFuUJBc+
         n47w==
X-Forwarded-Encrypted: i=1; AL+hErFDGtbPP7lJ5t6Be8hxFHLMb8r3vQz9/DiqnM2GQ9XzVvcL1nvvtKFxu/5MTtLeo4Rm4jnUreZYmDomc7PoB/zQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8DVQg7QFku2n2FU4ilpxvMnZXTBPimX9Wo9yj1++5yeNEEJuV6
	aavrjK5D1HZcVjzCgeqmiOdUFun3q5DD5NNzclitNkgt7bboi4YcF+wx
X-Gm-Gg: AYBFou2bYkf9r/275+JWxcX7GheejuLblL7+NHK9BhudZ325E0nEyvwXWVIv6DgjrAU
	C/lgKxr0c5Imoax3iRXd7VZ7sMf3uUgt2Q0rsPFIcehL0x5UeU4Ah0gTvYSH31k2pJvpmkdIIWl
	onmDLnBhqpo9Hr3LK897bkqPY9pJkiDL/xJsvdBJDZ+y3j8r5ZhTbH6m6w2Ia7roKE0u4daJa38
	Uau5WL0h6lQ5Pw58EhkM17R9uvZvMGl2KgB5eVyQ0ppqqWFUdJgeSesgIooHwI66+j/xgH6N79h
	guRhJWx7O20jOZk1m9SCP5tGMzDH/hx2yyjuY21upJeshBK2yTQ0e09NWrfVcQe/gzZ4QzWVSQD
	3Rp/T16C6n1+T5YIjkqfOjy1iH8NBAnqdY9AeAaCRPY3i7MXH25s3tFj2r1Wx5EZeZVDpqeJ18s
	FLIpG3JxFDno4I4DIK9htW1ndfuj4H7agzhF43/5Q+Zaq8+Kto8pghjEf4uziWxQJFYNY+ZmCNT
	SsGKpMohWtXE6hdCffv1oMCFiuSaXyBcuZo6+nIbnFAiQ7ej9cDCKnykkFTPWBopWhhNTooRn6n
	x2VZbHe2BHUU/AHj1xvgUnDbX6k=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_133049_328948_DDFED928 
X-CRM114-Status: UNSURE (   9.62  )
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

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav

