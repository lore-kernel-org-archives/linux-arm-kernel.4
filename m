Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C2B606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MQm2EmkR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zL8dLeHm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=; b=MQm2EmkRwrxrvm
	tis/124TKKbPXcYLB1SxSrlkCoR2ifnJLFHl4aZLbZ7LDR5eWfv+7f+ZmTxCfUIyX4xk4rrG9Kwne
	GfducMtIu09V2S5e4OV54ZLvo6JLyfnEu6MsDo18eoUTCVLxqqM1I36iCLTZdNcwZDwxA2/yYI8QQ
	hFhOR2Bfxe1oy1NlbutTtqKZSm/OtJTAf1jjxjk4Ui+l3bZNIBnhUJYslkWpzSSkUk8BuCi27R0Od
	2uA7qTRVR5eQh2u8gKTO5gXqFe07cnk+RASFfVEXCO6zTcZOK0QstWzburvGU9oRHdVfF41lIyupz
	/+tGrAlffTaicYtkNihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdEf-0000000591y-1h4Y;
	Mon, 23 Nov 2026 23:14:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdEd-0000000591f-1Qjt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:14:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f0481b35c9so21444765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475646; x=1796080446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=zL8dLeHm0tKeYygt5CNllHNikGeshqOsDg3GsTDL/PCGYi2AcDJvylQK4U3CnBnHyl
         SBPCWOiuVAGuJIm1aTJQSXDhyCOHH5W0Ngbmk/dVAKl55PER1a53npdyqYvVwG4RbD3v
         LFkdZiljvBNgTIC2eNs+72yMGICb/8yk2mPGIpLlGpX5qxaj+tzO4WfBdclkhfeLucGt
         6hQwT+W84Bi/azrrqM8J8Y2si/3m9/h1DQN4QYPTGj09EeiV+vCkGEYWml8miWaW92w+
         XSPXpVngPAE4ARBCH0wdnFA3a+hYT5QM2fudRfyuLrnHzeBGFFZq88HXjh0Yj26BVlVk
         mjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475646; x=1796080446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=qOS8Oxrph/xcaCp7vwaao4kbXLAWLmnlHAO1DcJUWofG+upeV2cVgqUPlj3jSrfc70
         90stpee+KSM+gKRWZhcIowUR64i3V+wiBhPZ/jvwH68Zdt7flTevGovd2A+cOIm+6lbj
         hMSUOSTQYe+KZP8wP3qAXI5EB+xFoUQXSQ1P/sFmSR7ug+EtSOmh+i/alDnXm8XSe4AQ
         3RqnSr7/WSVY+8if8O3Lv2XlSiLDYwuxRJ9UkIHljyflStvuf7O0edEO7bEoOIp32Ai2
         qiw2IBCVTvlKua8n367Q1tUpB330hWIq3155BNBKEcOeMEO5pA/7p3IZrMlirHiVFacn
         ZaZA==
X-Forwarded-Encrypted: i=1; AL+hErH8iIFSt35F9K1kGLKI9VY4U/KwFqSy2xwv/c+fd2468XX8ODtOKRPfW0fN06UM4VrEDO2+7CWWylUZOh+0NjCZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+l56uHg7pM4Fn/+brgNN/Cv8ZGCX22InNPMFP6Tfqtv9tg9fCL
	N5sCGBdrqv22G27pMdxhdHlCUQ3Oc6JfW7JbxjFVNsyZJ/9jx9jzacZW
X-Gm-Gg: AZFdTZep/+rEmUwYk4dNqX5tvHznCG9oXA4Vd/6N1ZA1CQNv9LVm5D5QLJOoSO6qika
	C6JN783NN/kBSBNpCu6QDpbLwbYTeJun4+6/ZguMwopp4aN40VQ1gMqMxgOn3gx7uygaEkxzMTm
	E9s6GY4AqP50zi8bdoFsQ24KrJRBMeDSVyxQ5FEwEYpSPYrP2VWyj3EYzB8QewGt1bHvtSrcZ6+
	RbX4uF54JQgaujGjwsdYhCu9dgpunHvxTTrBaMsmzZSAbEFI7IPodkbokMXgkPn9yNVpyrDoDIK
	zvwXeh+holUVaPZrpua4OEvUK81xbgvcE/AieoQivzaKv0xRmXLxWHpUut1UkopWe+Of42r4l1r
	DpZf+ARnxkeYWpXghZxoUXoKzy0I4kkl+GBsUwA7ljICQsJn43+vR8ve/0kMnbQoMxSAE1kqfea
	BWWhwkX0PmDVWllUrfYXrMEX0iNU6LBAclEhB/eIfkVV5naB09Jf+Pkp/aGfe2ThlYYWUCNFE+k
	YUMRYY3Lq7duRzmQNq1b9aO6jSmXoNSCzGeY/g1W/i977hD7/BLaRj7tM49PXpZz1wsgVW3X4u2
	zfZFptLPPCLXqPqXqvib0I8xf7jAsd4E2e1yDLmi0uonLvfxE0HwZv8ItxdY
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr111523555ad.3.1795475645821;
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
Received: from X870E-AORUS-MASTER.kkp-group.com ([2400:4053:d960:1a00:9970:cbea:9dbf:d448])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm58140215ad.33.2026.11.23.15.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
From: Shigeaki Asai <asai.6265@gmail.com>
To: krzk@kernel.org,
	m.szyprowski@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain attach
Date: Tue, 24 Nov 2026 08:13:53 +0900
Message-ID: <20261123231353.3288426-1-asai.6265@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
References: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151407_382432_2E952A47 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Sorry, I missed Marek's series. I didn't check linux-next and the
fixes-clk branch before sending.

I'm withdrawing this RFC.

Thank you for letting me know, Marek.

Shigeaki


