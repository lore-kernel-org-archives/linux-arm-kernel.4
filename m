Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB8606D12B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YKStVAib;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1uFGa+u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3WTLkjmkqK0giO2WWgQJb4HKr6ag/Th+VJz9Z7LhzkE=; b=YKStVAibnHEvuJ
	Nax7fRyzS1pLNB57hGSreXxHHW2TQcvd/zFeGI6Yd70P6a8t9YoUfJT6U9pNn+Ba0qQxpQqwvCQPM
	HcHZKxQzMRr7N99C7ZIufrPJNXtgEV1qtf+uxMPWuAUk5WBVuvqNk7Af0OacJAey6HRTd42c5O/qy
	IW/sBqiQQGUmY92yGW5RkXkD/jFB25NfBdts4GkV0XNdyWl/QPlVlUn0ow1Z92xK2J0OX+7niu5vD
	Ecsx/iqCRLQdToJ2hWgnpIAMHsxroPuIoite/4BiWXCd+I06qWrW9fhdC2U9jxzHcBKLZSTZrQdN2
	YverxizclujdYQs+Wk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Pl-0000000GZJI-2nGQ;
	Sun, 08 Nov 2026 20:22:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Pk-0000000GZJB-24Rr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:22:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B2D061CDB;
	Sun,  8 Nov 2026 20:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A993F1F008BE;
	Sun,  8 Nov 2026 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169375;
	bh=3WTLkjmkqK0giO2WWgQJb4HKr6ag/Th+VJz9Z7LhzkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y1uFGa+uB1K692o6xRi9dxiAJhV5TDEsLvOXOqvjoU6tlHWZe9YSnQ6kul+FIDh9u
	 YFnISYlyR7Mthg0YUhbjp+KKIgIZMsU0xO3FyKrz8s074qoxIpkkQfWghdP923nJgV
	 VZehZVFQsnWvsIgLEddQJOHhhLr3Z85++3OsjPRD75s7sf6hEZaU7FPTGvGKcnXa7O
	 9K3+lZa6hBogb43nHvNjtDWZ7lLFrnf1X8fStApXMkovVxLTjwXHgXAiXzacmVoSiS
	 Ho3Sv6LjsFl/XI76WDB6mXxE1ciCTAIWIk2+WCKRf5Y0FJ6KkkH4aM9BfQHcgLmirb
	 Sjj8z2ylxk0yg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
Date: Sun,  8 Nov 2026 14:19:50 -0600
Message-ID: <179416929279.628393.568857102058027472.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 29 Sep 2026 12:16:46 +0530, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: Add initial device tree for Kuno SoC
      commit: 7f6a63bc5fc9bed3fac66ac57000882926d25f84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

