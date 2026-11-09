Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA25606EE98
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=32OOPNYy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dEhe4tjn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCocyMKf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=; b=32OOPNYyftTOcR
	liGGKInRhp0quGYd0pivlWt3V86aTDYYxctudXsph0yYVBEfOH+tGKV1hqh6Rit/wIPU90n9omJv4
	+eWwRMHpeTraFRPNfOle9+rZeIIqf78i4pUPY0dAK3T+dr1qwgesNw91PL5S/xAbDbYrCOZihC1m9
	w+zmvhc7GxkvPsQQuNufIbWlhnXFkHwC6R8y3WcWpE8G9GP3H0BiznwoViXlHgGO0bu5p4Ik8/AVT
	uJ14TK87IxBjUkhFXkRAaqZulDs5bpw8vERKsmpOXliwj8xBadBO99y/+WaTDdZt6nVoJ78+fVo5D
	VMAYxcZsXC/g7hURGRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL5U-000000008i6-12AL;
	Mon, 09 Nov 2026 08:50:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL5R-000000008gS-1Gag
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 08:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=; b=dEhe4tjn/RK2dndyOTfPDzLvP+
	99YFlBo7rSvaqb6ZQFnuUQGL9QVQrajtZipPhOG26xEdDDgDnuQaq94N+3bNwVzm6DXaOkaEyQTvJ
	uXBwr0FgI8rquWzhukPtx5SIdUqnAYs/0RcA2Y1f2lLvqy9fi29TGXTCSZwuJnQm6nnu3IkRtGjc4
	FJdEDXEjDkGWJCjKshXjV+hZa0+se4oEl5pKmA60vJ4oDhmBpjB2BpKzZw5wfBpHcukw73PM/G2CX
	BPGsRDTUtARW+KmxIr71qkL/pfNElVPiYIm8Zo2b2omce6qkE7Jf2rDB2jQqj/FfS13DpzyBWqf+O
	rSIE4ZXg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL5K-00000006Tl0-1xtb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:50:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3788465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214236; x=1794819036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=cCocyMKfkVRn/yHfi8425gjU4ogBrwKnJ9yuo8ClRX/e6ZDpm+W7gDXLMJihzZa9h/
         MeG52DYNSpPBLu93EPJZTDAWouBmmLVq7WR+NkhvSNcNbh2PYVL+KZJP6xgs43nkvr1G
         WVFD8oazP47nSPVLJ85peM6eDq+lsDXdAWF2gi2N47KKsJAEGwzhnt9tM+0PhuG6zlH9
         BapbBDf9b36+VXQaTBc5I4IdMhTDed08UcKseWWgGrP88FurJoXfllK9xyUDIs0W8Oa6
         PZLBlwWE5/7+mAJ2mZlDnczkJIfwdVo5HQ/XLdj34E8EpItr//XmELrIgCiObgUc0J7I
         MC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214236; x=1794819036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=e9KVIe7ylSySr8yHGCfocjY0Dqja83j5AfA7KM08ICQOCnYPhCYnNxPTFTiOvKqVAa
         RvvSgsiqY+twmf3YwsYcCVVRtsIo8T3FRSgXYa7amchAuI27CLQ5qMZZlcXvXUBYed/0
         ZO8ah4IIfcNNlwVK0aB+kcuGKXV4EAJ9ubveytVRZhooF3R+l1KM4KmZePV84TIH3N82
         gTjK2fl/U3MOSPcCJ6wSBZx5EY7eBOlOli3NLIbh8iJK4pwG/GA7dKlOVZjM4cGtuj9K
         xpn1H1L6lxEh78m+cN4kn8kb0wkvsl4oAvkME5jn2p4Y0a+bJU9o7tpqc+gm2bea23h6
         ZIzg==
X-Forwarded-Encrypted: i=1; AL+hErE98kKIXvb/iNlrlQWyiv3oP06yCg6mc4+KSsjGBxhiODVk4kqGwPUsr65v4LfGdvfR7uNqltDdmfGckQj2NhlS@lists.infradead.org
X-Gm-Message-State: APuU4Z9grR7saLk0HVQW58mlPRug9xqUprCHpIk27W/O2IL9l3nag5er
	rYZOT1CgEwYLVoMA3ABb7OCpmu80LIcRQ5XmV8SG57kPKsbHuPapgBh0
X-Gm-Gg: AYBFou22VoxO97FeEVmeBAAw07tnlrgXRKT3ESyzNkkKZJryojqvf9sWA/9HZ1LgbS5
	+mwJUPrPLmcx3Os0H2UfOvntZBDp0JPrUF/dvzy1fD+8OnRPjzQBdrtJFcG2hoM4wFOUwxd/sH8
	fNnCeSbMnn6mnJ6UOWyHdRQXGG0YdVwPRtYDJYHhH9VsGj+CRMgUL1SpCnSq4mZk5wUd/r75CAc
	kk4NAMNrsbWzGo6hpfQTuXen348bO/UDoVYE/SJDXH6hKLsk3xnO7qKvDiFZFjiGpuDao2WxPsr
	kb5udAnzVQocBkifp9xyxiqO83hch3qIQZXAsvNTejH57+AybuKLdpnf+QQla5ZBkQLW+8qjaBF
	14YDmRwqnmpF1yT+8nEaX7E1OylOx7Lb6fSe7yeiy0P+tOcrBUksOz1HfIo7wi3UqpHF2hoIRyW
	3kY04DbIPrDiKQGiG+2npw4TiF3ehAfJUF0vqWtC5H5OeLG5FRvt5SjiqrswuKT0O6PdMWqk8Dg
	ABzRAXIMv3HknhTCVJXKaunk9khGMxzVz0E+oA3HACK0flfHRw8e7ta60CA0Er2J6AEBacyrFxb
	K8F2fKT6vhYp+AMRufNMKMm809E=
X-Received: by 2002:a05:600c:3b1a:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b963c7e496mr65389125e9.29.1794214235848;
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm147015055e9.5.2026.11.09.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Date: Mon,  9 Nov 2026 08:50:19 +0000
Message-ID: <20261109085019.1751534-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_085038_712798_F0887CF4 
X-CRM114-Status: GOOD (  11.09  )
X-Spam-Score: -0.2 (/)
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

On 09/11/2026 09:29, Krzysztof Kozlowski wrote:
> Odd license, suggests you copied it.
>
> You should retain original copyrights as well.

The license is BSD-3-Clause because I used sm8550.dtsi as the template
for the node layout. The values come from Qualcomm's downstream
anorak.dtsi, which has no license or copyright header. v2 will add the
Linaro copyright from sm8550.dtsi. I'll fix the other comments in v2
too.

Stanislav

