Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0E606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1I8EOVAD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SueYXC5z;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=wd0GiuRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=03F7SZfAc5Xiw+oreHZ8/TiL7M89ri++M35Dlm/XT4E=; b=1I8EOVADrIVQmd
	vjk0A0QNTCguT2leXYbMMPPCC7zyOho+RtxxU+O7vNyQxB+cfKuiMmPrnGfDC5/kYvFZYrcRc8t0x
	DgqEiafxu3PBfnnaAW6XRHPKAiz7s0iXpNI/RtmZ7Vl4h+o91PzyDcRkV3+geLDQ8CKLqxEw0HyQ0
	uWZU/FNXtMwBao02uftkUX8mPDKGTznjPcXXDu1cLJLtLvRlg1PlG5YUc/Z7pjgz5sx7txq7BBAL8
	dOmju0gwdu3a2tkY5fC5J2cUHv21FLecdr3BsG45/VH6q1wCIRq4Fehcfv0pXz0NgpxBbjsmGhERP
	K31yddvqjU41EyPhQpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXA-0000000EXpP-3fay;
	Fri, 13 Nov 2026 21:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVN-0000000EWna-3Bej;
	Fri, 13 Nov 2026 21:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=03F7SZfAc5Xiw+oreHZ8/TiL7M89ri++M35Dlm/XT4E=; b=SueYXC5zwiCDpr/tchshjUSgh/
	w/ekUJBWJMKypMtFazTt6NQiUC5kwyNdRtbW776nIUxx6Hb4nUWmbF1cX9RANzC2DWmG9l9z9vwVG
	T5Uw/juKYEh2oQ1C/OR009neK807mtsmUvnq7/8kJtShJdm792+Tb/AGkA6vPyn+4XLifc5kyDoQs
	HuAKI68JO1yUYBn8+K6RUBykFpmgi+GYTTpeQMCuxA0yCPte8n8FO8aflHV1W9QMOdZpY/C1w/qS8
	Rt5d+akKjrxMBJZhKqs2MKa2lJAtLBZbwHDO3ilfvQ2/Rq3Y7Oh88PC+jPK7CEMl/YGlC6znG6FhL
	4fNDMI6Q==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVK-0000000Br42-3LE1;
	Fri, 13 Nov 2026 21:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=03F7SZfAc5Xiw+oreHZ8/TiL7M89ri++M35Dlm/XT4E=; b=wd0GiuRB8fKuoBe2eyLp/Uesq6
	l9tsdb/O+BXGEddIlE3Y9v2y2Cx8XIE6stWAir6YUkwyBzruUzaMP5mBDKeL+H6fyvi35GaYlpaNb
	jRT6Jwo82Hc/RipfiqASoc8JGzy2nXRp9VGqTP3MSSRnmpVlIzMnU5rSKBBAs3vpLGbF/IgOKIbpV
	Th6VmIiilHc7oYLS7VGvVRuF4ZNegB1Cu/GUpa70gXUW5mCrxDHnC9LpmstoacArsHgMWfKMeeO60
	bNM8Z2874BV6YxymZ5dIPeGDbSLwEJWUg7BC3sKvL9XmF7Pw1VWkVNHJ3JQParF+shF26uW/g7AUJ
	rkIh8qkA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2 RESEND 0/1] Enable audio on UNIHIKER M10 V1.2
Date: Fri, 13 Nov 2026 22:08:00 +0100
Message-ID: <179460406447.1165597.11270101508665588376.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
References: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210814_888604_EB90F41F 
X-CRM114-Status: GOOD (  11.39  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 11 Nov 2026 12:14:34 +0000, Mizuno Miotsuki wrote:
> Enable the internal codec, I2S2 and onboard microphone route. The board
> uses codec revision B; that driver support is already accepted in the
> ASoC for-7.4 tree as commit 157f7cba77a9. It is a runtime dependency,
> not a change to the existing codec binding.
> 
> Changes since v1:
> - Normalize author/sender identity and preserve it in the patch body.
> - Recheck ordinary and strict checkpatch in the actual Git repository.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER M10 V1.2
      commit: 587730a8f9449745ec3ad26e36a2770ee107a93a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

