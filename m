Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F8606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XszMmt0x;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcba/lPW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=; b=XszMmt0x98hQcO
	Wh4QeHYAnAcMGBKgsAnej50MMr6S+Chco7257ab3dimt6mmMkKqtOxf3BOOUO+RNYZOjBfEcXdp6r
	ug5JxVU2ysMWha33gyR+hlWBzPAHPTmgX7INUcP9onEVnvuMaBPzWCYQq9CBDrkMWZox2g0JCO8XY
	N6tn0nm9bK6dWkzp/YpuHwpIm4JCsEiyYsoKdMC071/uR+NVhwI8T3E/VaPoetnXRL4WQ8uxPzgVp
	mar0fjRfoR1APyH7WhrPv//G8FgLyfs0EFS23L27VB/X3s26pqMcY4lyj8ak9e7+YDrfrBEKKB2Lu
	Dj8Jxq+QfV53sXv6n1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSnI-00000001IEn-1r8c;
	Mon, 09 Nov 2026 17:04:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSnA-00000001I8k-3jj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:04:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1605002a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=xcba/lPWwKhQtr/ZiZQDThBDqh3FwM/AU0XZVG2ZCwr7Vhz4kp2orYaJutZvruq6uV
         M2ZhKOemhB0B/FyXO/KxPmTCeoiXV1lgDIiGmEY/YnOPhQcM/2P4Q6wGkt6KdTALQRnW
         cgI91I8EoaxvTpV61Sz2+3Z7yG5oY7tAjhMyAXtenSw7XINjq40pioWXw+BorR89t+Sx
         rnZX0zXkC+gidfU3bH0OIjTEq4xsS4NCt6GOeXE7LkJUX7MAiut2dXJ09gshvPDfzRyZ
         tfBI4uiuH3ddGv5NAbG0ZeQewY/GG3GuKd44P5j3qc4FfXSpeAKgUF8ebdCeaI/zpg+V
         82rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=ujveF6kieo/hOMndmpci8FrYcd4WzD6RsY1eiZ5IZKalXl7W9O0SDxvPG0UZeCBkP0
         7CR8z4FYFDdSZddjbXkNAi3eCTtpV9/UkGjB3CZ8S0vnioX+vyZOWS0r92LHu1TZTnT2
         EEcXfjA6OyN5CByVQ6k7LVe1LBQ6sU4zTq9Un57AE2i2bmNJ03jfx155INr+QHi4Dkk0
         2W1RYM7GebXexAMaawGk67cVa7iFbqZctSHAnDJgD3k5Hs7idkHBNK4NLhntAAse6v8U
         tomlFebZLsNw2fSBhcuECU37+wGa9+W/AuSbtOJPOlxO1ut5+QmejYmSW+Qn3JObkozC
         rb6A==
X-Forwarded-Encrypted: i=1; AL+hErFg2XkoHBzDVocX+zavj/uNfMgHB1TItrursYzZMqxpVtpxL417X2TDq7PESMnfDaZK2jGtcxtkTPNgq3Z5xNBZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8lncZkQ5RqDF74/sOW6FdmAHI/fzl8sLU2xSN7N07wb1ROPiot
	Qu7mf51KzEmhu6iFbXa26DbAZhVomGbcNoACBqyGZxSAPaItC3o9bdiD
X-Gm-Gg: AYBFou2oRV4OvJ2kWjgPmBf4g5qXF+EliB1mz+vL3z9S4cIncxMQnxb0MBc15m5XS3l
	Iqw43aNrnU0MCnNgvrnCTaoktSvg8+5PYPcgf69Ixy0eUZedqfJFsxml1h1S8vKDj7gx0ydjNID
	o1EvyNt3v8CLDJq2JyZlFfwY8O4yakKPBSxsoRWN1y91/suUhfRDNnFLOIXkhtkupNgIhj/HoEk
	tNz6X7yv26WFZYleylb5dOgd3mJ7QqazETy9mMjaMAwYhMynRWPv2k+Yc1H97u4vO9Z5tqyxFs/
	tU8HqF/ADYnRVqtrJf7DJfslM5kaMXnyQIW9FPxfpRe0v1O1SjpGCVO8TVDDYp3K5a9omIt1Bm+
	ch1+6jerNqoNDLnYIkvNIHqG4798b3+6Lt9m4tVdUPoQY3m1Ni8bVA5m7ZIuWMmIo5/38LAc/wy
	fGxfZA0YUArS/BpFd5K78WqcYZ6DJ00nhINFNb0+OA5qw6pwrfha/s+E27cMbm5muQ0KzsVhykH
	MfJRNmOuEnA/n+eSWVyk3jhc6o5ilYQAi8wiGn/n0wkR7wDxsS8Ftej+yG0z6mUOLxb2YZJdycj
	nhKMHRvfx+1J25l9WtNRKjD0cwY=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_090424_951486_C95020E8 
X-CRM114-Status: GOOD (  11.17  )
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

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav

