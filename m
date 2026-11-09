Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD95606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vWNlenPM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7lXWbXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cTKHXfqBESP9wt5hJN1sKPgZ/ergstJw0rnMyE87Ff8=; b=vWNlenPMGPi/8v
	YJiBLsETUqkCWO9XK9PgzwLnkLivlW1kuJzZ+E4Qa8nka2UkYJP9vo1Hm6lMqj+Nhm2+sThs2mYf7
	rirmM0WRfUp8n+k9rhPGpZuPgAY2HaUVXxymCFV2DwXS9oJ08OG6WuSynDF2KkUt0Km8HYep8SYih
	o6GcndbP5PDMPxx0Q1ORVD0AjoOYY0kJnhsCjQH/B7hED4tCaruWGuEcaEWOhr/fB7POX0937ve0I
	6g4rLTf4S0XMD1vdE4T3dl4ri0D8ghkhcjKYo/jIjPIBB3zZPugK5sKDlmGHK+P9bbHSGBd9xH1FO
	y69F9axOOaYO7HxNb13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQPx-00000000x2L-0McE;
	Mon, 09 Nov 2026 14:32:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQPu-00000000x1j-0ZVq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:32:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D8D3611A6;
	Mon,  9 Nov 2026 14:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B511F0089F;
	Mon,  9 Nov 2026 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234732;
	bh=cTKHXfqBESP9wt5hJN1sKPgZ/ergstJw0rnMyE87Ff8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c7lXWbXTc5U2+EEOmtj4LKiqGiciACq9w28CT1dDgv1HGmy4/mXjyOKpvMki+o7FG
	 IYio5bUPJm33Qktsyua43yE1FsJgV0hIwuGRm3e2a2LsZUoaTS4x7AtDkeUuYIqCbX
	 TdXY5ExVojnbpTgnb2/PuuigbeUOm8pk3nvtEq7zwqfH4DKpSNpyYC2JwASnB4NIh0
	 b1GazwKm22QOfb7vYk7bjYaaTTYhowEMRgefasOYRg+tgHVgHHDFLbb9COI1Jt26aL
	 QHyxPWS84PGsDFBOuE39hffE36sg5w0FpT6lQFDYEbxOH5oOhFH01+Yd7QhiWlywmO
	 IKz2N3saJVLuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
References: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
Subject: Re: [PATCH v9] arm64: dts: exynos: gs101: Add thermal management
 unit
Message-Id: <179423472913.182531.10413692943270091407.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:32:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Wed, 04 Nov 2026 17:17:58 +0000, Tudor Ambarus wrote:
> Add the TMU node and thermal zones for the little, mid and big CPU
> clusters, and make the CPUs cooling devices.
> 
> Trips are ordered by temperature rather than by name, as the
> power_allocator governor relies on the order of the passive trips.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Add thermal management unit
      https://git.kernel.org/krzk/linux/c/c916d326360966fa41b1d9c3fb659215053387f5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


