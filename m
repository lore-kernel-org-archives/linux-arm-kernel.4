Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405060A263E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2onR3y/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDL9HOEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=; b=n2onR3y/Ttw1hd
	GpdC1XV34mRjLmi0NwOrnn/2F24db2u/4aVmzzi67mqDbOyuIJ153JNhCTPgQ2y94J/DPO8idqQOm
	YTUDTLDeU0wPoQpset/zH/CmO80N9BrzkI8Dv3NILx+GfLsPS8BysvRiRtsqo6m9a960iUnvloa+2
	2Fs2krQfJDrye56Ro4DM3gRISGcT60+XDu91gBIShBV7WW9dcPMkkjeNfr013PIvDjFQ/aK46/baz
	D43JID/D73TfQPWsiZ6wliyJr+b5AMS0V/ZobWp4NRpCztNQUJHF+7r3XWBmtqvh6zNdhm+ankHzf
	M1u4NXQL4zorBKSnxmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88L-0000000DGYr-0soh;
	Thu, 19 Nov 2026 19:49:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88J-0000000DGWn-1Z7N;
	Thu, 19 Nov 2026 19:49:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCA1960E5F;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117762;
	b=jOGxAN665LXvhIOigHaByZD5npa1mcdaLMLLITuHrVbl7WrczS3ItuAq4Qlkj2FXqX+r
	 2tIBP6JbPYA5E0eUfAQMMvkBXvsBgxQWiaSfjoEihihMRygAJ7LbnxTsOcniAXpUYJ4VS
	 7mhSWOm1OzmnL2o3xyvgB1NSBObNzCeIx73oyAt8BX6ibOgWyEJg/XX7OXOtUz4xM+PNV
	 rvO5PUxHzfsdmRIZtEzFmd3d4QUZYiCrRRHJ8fx/9wc+H6LZs6gwR1HlZRUbHDd225Y0Q
	 cchmIdoFouK7rnThNmxA+8L1LUfa2sh+o4XHBIgMjz/QNisuRWB/AHcHwO3dhDnjXGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=;
	b=0ugLYTDpYDizhsrY2JwfTpy6zHBnP9lgghY67TjSFCM5eoCLYJrepNVm022JYika5gq0
	 TrN012drexdIsEF1JOtagwArcqbTDCMMIuJNcSfl84ZthssLpk1HBHIaPFy7X2mojyE8C
	 XEM7xAG1HHQ+Ef9fAUzwqu+gydiUJRkI7jGt3eXo9STyWLrvYBHdKDwNH19zGmvcFTsCG
	 BaH6PTKA4Wr9man9xs4sRbDXZMh3fcoNdHIW/Ded+Zha4N7qUHEfdqwlWFX/I1+dO5HnG
	 qAwdpb/rJ7mdK7WlUBI7zqakeXRjTzCEGH4VgkC3Q8sxE4XOayykxxEUXwfDkY2o+MQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABB7E1F000C6;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117762;
	bh=Gg5qBFruImsSPUzRHqmcU2x9q+Z5Ol2aaow8kapAZU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oDL9HOEB+BsQVLfXskcjJUwdtQLc9YVRmf/9ybMuj+en0t+aBlR7RcpJvKcWUMs+M
	 4RrMClwqsPeNFLPz8WZmht/B/+N7NLRM0j3mHbJ3suAVW40M1dU4+98iizX5GrvsD1
	 J90hwnYsuA0lIzUE6foK+Wk1IpS8z6WrEoqJYh20piweyIY+SKs3fAkf+FfTlXvRUG
	 4pqKwx1FOaeTN+F7sVlgCkIrh2IFpTTVxVytgijh6pZroJNFgNw2xNBPzAOT0e2p1U
	 pQ+eM5aR6dI7I/+q98eKrdOnkkhjiqsxo7EzRw69HwbZEzXxdr9DwrfCwab2Ib8eH9
	 CWJ4uEqJHnHFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 389034B404;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:18 +0000
Subject: [PATCH 2/6] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gta3xllte-usb-battery-v1-2-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1209;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=v4DbW6fDalAVYk0Te5ZSWb09z4/f2QgblZnvvRGhkXU=;
 b=jmKfYf+qTlQd9d4FBC5QF2O23tXQdfJDxnNZ6ipXFAqDnWYNWcpSMYyMMu9M2IdQPbhmBkBQq
 wzptHRFlRhwB13miEVgN2al2PTGUYX2ZVzT52IDPbhv8P6+WDAhrLXd
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Virag <virag.david003@gmail.com>

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. Clocks are the same as on Exynos850.

Signed-off-by: David Virag <virag.david003@gmail.com>
[Umer Uddin: use samsung,exynos850-dwusb3 as fallback compatible instead
of adding a separate match entry to the dwc3-exynos driver]
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3

-- 
2.56.1



