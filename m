Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB733606D13F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V87Lq+h/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnAjCatM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+TGNtBkbY9q8F7TsjFNpGCb5Omd+5aPs8mlI1uZL4OA=; b=V87Lq+h/Wf+Au9
	vHK37wLk/6w6Y6vUEXHgN7NkLaOGSMITdSvQJPUJA4wiGh5eHHBa6kXeYCdxQDH2+z5Mbt+1JJj+2
	EZD8IWeWEkpqaWsaAj/ry6aPRXQl0SE9jnpuqvkykD+7uV/6D3M+jgrGSJHSlxtCS6QhY0LbY12+7
	IXz94z1K0UwB+boT2fQnYGDAdx2GNLlkbfU0Vgatjnsv70ssL+fIUa2W7raZqgQCMcQ01NQGk65rv
	00GXQTfbFL5IKr7MV578YJ0KfoYG34BtEt51hDm5Ba0MZO0UYRY7huURXm8NLuvCSG8EVW+vJuAL6
	DcA9XL+2fxM6SPu6Ywyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Pp-0000000GZKG-390W;
	Sun, 08 Nov 2026 20:23:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Pl-0000000GZJH-3ZK2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:22:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EE8261D0C;
	Sun,  8 Nov 2026 20:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841471F008A4;
	Sun,  8 Nov 2026 20:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169377;
	bh=+TGNtBkbY9q8F7TsjFNpGCb5Omd+5aPs8mlI1uZL4OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KnAjCatM6jtU5Iv559+8anP65FzZlX7oYCx74Fw01CPC5a3xdNRotIhg1ODU06D0Z
	 3O1AJitHI8qNpJZ2TdesIlen+KA2pweXMoaeeHhllEvRpgnrKYuf0ca+5X+X+T9PFM
	 e/mBp6YgR/gVUPKPhiNoIDdM14QFYZOpRJ09ag0pzjshIOv8+Y81RqT/WW64I0qwoX
	 DtDmRmZCQeEWg//12huru/SDg4iR2BmknRNu5YUL8sWqyRS8GFsfjJplxY7V1MeZFX
	 qw5EMIto1jlAmgezvxoMpI6F4YHfNBQi/76v2ANljD9tyY7j7gIxQfpF2huzvsHkkP
	 4Ur940OSHY4ig==
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
Subject: Re: (subset) [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
Date: Sun,  8 Nov 2026 14:19:51 -0600
Message-ID: <179416929284.628393.3018595425203478493.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
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


On Tue, 29 Sep 2026 15:18:05 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
      commit: 7f6a63bc5fc9bed3fac66ac57000882926d25f84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

