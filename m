Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DTI6VsGh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=a3KaLGJt;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=h3aJvplq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gAIN7iE4u/BQ8emUvIO6sNS6XCYcMUaeapeftYIyo6s=; b=DTI6VsGhvO+jXf3U/zfdOKkHK9
	+WAMS1fwli8T19kZmedzl7zvle2aeIEBhtq9BEuDXpoIIreWyvHG/MalFJx7QL+H36A2tk6lwutjo
	ehjO7/NgyMnG16YAjJ4kyzkmBEIJBZ9lgW2imUN13G0ob0pe7pmPkTzDJwOu3BUue6XwNEtpbQXHp
	qnDdyWtjIV1FoB5oh8BxcjaClnLpDGxFjneATiOCBW+g2Sa8xB9sr8jrj+UmpysLGpXGHS6gcdMhi
	dhOX40l5HTSJ3SCpkvmtyIzlXyIEfOqfcHUrPraAC0jxvsjoTw4n/49fbENDiV05qzqPkrBdTETfd
	2qtKyxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkwh-00000005jyx-1nP3;
	Tue, 24 Nov 2026 07:28:07 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvT-00000005jL1-0Ykj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505166; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Jw1B75AZR9r37pV72wMrabDcm66aq2L5065KPSA7+H3MAYiJokwL8WkpOc9nz+yebw
    R52KxSfyLCxevdO0Vh8pWaopgVt/J02yGiDaBIB6s78KG8Cw2ECT9wwXtQy/Cs6YFWBP
    52n6H5Tmf3gt/V4h9LdxzvISaAR3h5L0YUZrrykv4jFZTsERFEVmePoddeefHXt3x8Qi
    Q6vfLOD7VIcAX+wmBGJ03w2GTeQI7X7EWk4X0hZ1TjO8IIA9us1kXkQ9wJ+sDLZet9v1
    /fr9JZG3lUVFuwOFPdrTWsPfGYBo97jxKTpKajsmHyBbA62ig030qEZYxeUInLca+gva
    ghTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505166;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gAIN7iE4u/BQ8emUvIO6sNS6XCYcMUaeapeftYIyo6s=;
    b=jaC9A0CwwPT26qXZECMleSSd86xcXk5Mftx5phl5RznaJES9XY4Oqdo5LBu/C0RFhe
    rWTsfelWx9RZx9/mXcw1MEII7a8U+91QH9/PgjLwgawrjUooBBBgfVyEExMgSCbMlArI
    lMg+XWZs3fEyJ4NJeAl0iwqMsaxRnaSc1WA4Qd6g5+cVE3ZZw5affwnQWPx8liomLWHd
    XIuTDJjF4VCjY1m7deqIvYEtb5alALG/dLXWpsgRlZMeeS93qumVRRadmZwvCVbtlKyr
    /ikXjkqlBmfRFsI/TMtODweKq6fVI1XrojjSB00/JUfhc8x5SVBu9Sq3JOLlvuyBK3g6
    0bHQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505166;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gAIN7iE4u/BQ8emUvIO6sNS6XCYcMUaeapeftYIyo6s=;
    b=a3KaLGJtVvMLsOwdQZUYs+7gK4y5yMMC88fm09lTN7l6NG9gu8eI8W2icosjN3MpA2
    bj6C07vlxiYwLcPYf5IkR78Iqaoz41qwEoq8WUwjURKL22gWnOuuuLOfP+HjN9KNrTaE
    Lei5ojY3O7JlF8Hc1MihqnTEvrTrPZzGN5IoK7krNf4CFQvSh+R5yxJUvoaRqaz1Yz9y
    3xagrdTDB3n0mDS1sZE14Sn+jRVds2NJ3y1yPheBCRhVQt2KRPv+oFiMFrMj/s+zUYTF
    LHIAzqKyk2qD+bUdyyGEfw1Wkhjx+3NfNr4ib/LP/UazcxgirFOK+s1ooMG1J/EIxaXo
    BulA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505166;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gAIN7iE4u/BQ8emUvIO6sNS6XCYcMUaeapeftYIyo6s=;
    b=h3aJvplqETdwNO8kY5RutWsO9gupBKll+2yH2AoQUGLuJZB0vkQ0wtDTAaen7gHL8k
    5hFyXlXfUyNF6mSyn3Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7Q51HC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:05 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 01/20] dt-bindings: gpio: twl4030: Document REGEN GPIO
Date: Tue, 24 Nov 2026 08:25:41 +0100
Message-ID: <21030cf6957c49c8114829970cf64c2638050220.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232651_353387_304F05C3 
X-CRM114-Status: GOOD (  12.36  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the optional ti,use-regen property for the TWL4030 GPIO
controller. It exposes the REGEN power-management output through the
GPIO controller so that device tree consumers can control it using a
GPIO specifier.

The property is opt-in to preserve the existing GPIO numbering for
systems that do not use REGEN as a GPIO.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Replaces the former REGEN regulator binding following Mark Brown's
      recommendation to model the control signal as a GPIO and
      Krzysztof Kozlowski's binding review.
    - Expand the binding commit message to explain why REGEN exposure is
      opt-in and how consumers use it.
    - Commit-message review assisted by ChatGPT.

 Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
index 96d50d14c0710..25ba4328ac2d0 100644
--- a/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
@@ -47,6 +47,10 @@ properties:
     type: boolean
     description: Enables LEDA and LEDB outputs if set
 
+  ti,use-regen:
+    type: boolean
+    description: Enables the REGEN output as a GPIO if set
+
 additionalProperties: false
 
 examples:
-- 
2.56.0


