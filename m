Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bX1b/xdK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFVe0dVv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YQSzvWS6zTIzZooEFJ+S8ptQRwzh8qMt46ZAoG1Bp1Y=; b=bX1b/xdKS5KQqE
	mynSkCGhVfv8i8FE3+kAPd9NBeTG535EoHjpnLwL5k0LhTLnLnVmGOkp4q2NVJnb0CPr+2gHXCPkV
	IpJw5lyhIevLAeTW/b1iDyaI+Mk+3ipQ3Przn1ntZMD7GbRuJu1w6vxM1WYZwlrFmSj67CUhv1miG
	24j2lxHJW+rSWB+FB9pzTMToaJu43B5e9eNi8HPJjbHtWvWlPN65SNm6r0F7GcOiXBJOkcWxLI8yk
	CuXD9cUbEAYGBdkNdiMPiN6XpbviKsQTMNzsbgTERG+AGh6M1ESTKrzSSDh5VAgGBOddPsOhZPqfk
	rNEILfOGtqvYMPR5oKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQjO-0000000FSYS-19kn;
	Fri, 20 Nov 2026 15:40:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQif-0000000FSSR-0clo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 865656194B;
	Fri, 20 Nov 2026 15:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844551F000CA;
	Fri, 20 Nov 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189208;
	bh=YQSzvWS6zTIzZooEFJ+S8ptQRwzh8qMt46ZAoG1Bp1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QFVe0dVvt28ckDj3/OIL7wv4gs/JUQa26NW8VweXiO/SpTUAQQWaLRY5L6OvvwglY
	 6MuTGBeOztmo/7lRW0inDtz4DS9fALbhKq9RNjRQwvMrC8F7zTA4Z1oSMhMjs3EnXo
	 ImQx5A596R8IdhwmZI1rlBbqUqtq5AIW5jEphDKhA8OLOY8p32yUCwPL1znHB7oGl9
	 8JOT8nTguNx457UgpDqz9VeJe/D5rVebMEZatthQA8sSrjOmGtrbyyBPo8VLo03liv
	 vEio5EfGkCGadpl/THgS4NAH7hmFr/ObTHDHpzJVi72m2vA6KL5H2N6ywjD1/3+PXg
	 8V8vgB9Dmy6jQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
References: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
Subject: Re: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add
 pd-disable and typec-power-opmode"
Message-Id: <179518919681.24590.11128258727258522327.b4-ty@b4>
Date: Fri, 20 Nov 2026 16:39:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=398; i=krzk@kernel.org;
 h=from:subject:message-id; bh=D3iMpGd3fm5tODFg2yXaCae/ehKfns6CoB1TUYmGPtg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAGnQaiLKqmL20GqvAU/RpZWsec9j616hpASOH
 1EQFiJvyuWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBp0AAKCRDBN2bmhouD
 13XED/9uUAyms9A/DvwZLGqEukpX34vbGC7oEtKYV/+/YuSrqywvM8Vo6Sb1xaMNer+3O+/pv65
 MsO0xuJzSb9tma4WI50YInMkaAfrrsMLF3mJhD0Aw8wGvCZeaiMnIK6B1Qt3gGPHUhI5u/YzIGs
 joSn7qCisruHsr8GoykWpmygPj6dRINyWeiP22TwKDphcpxSypjsgGbCrS5PWIoh1MQYYPVMyx+
 08owfJm+ca9JPW/b2yRlBmWwcqmXyFrYIu14v9rVKqdpfSPmjmIQDVBLas11NtzrHlNbcFoZX21
 yrwOwNcSo+pQWB/cJ4WDTafoWr7oXG4DmDm4L7d6YZOrqnAzBoGoU19nBhRWMZTolSMoiJ2CFyI
 esdKvYSmCZ0drx0/he+rfdd749iOIYTsF568ss68e1ryNUTy1z9lmyW6SZMlWTPgj7toEGRznP6
 SLDQC0jbXg0GCGPH/coy1pS/us8W4xZRxBKPaW6dmYCeij2rRCPKSnfe9GSXmdOIem7J3q/UCD5
 wyOqJf+FiN/EpRh2EpKU6CvMoVVvv2nBWekE94oNEA5Jwdx2lUm5awpTbwZzH2oCj188D/C46W0
 yF0qT777FryqCg567PSVZgMFU8MBXU+Yie/FD6+curtOuJwxDl8/7kJCfvXOQRhAlJ/GDFiqPfq
 6vseTVE59bbnZFg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 16:44:29 +0000, André Draszik wrote:
> Revert "arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode"

Applied, thanks!

[1/1] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode"
      https://git.kernel.org/krzk/linux/c/49298fd7c685adf0d33aaeb92cab7c95400d2570

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


