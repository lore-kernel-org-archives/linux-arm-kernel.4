Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C460A2604
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPfc0e+i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=59/hF3sIz5vy5pjCFH7TIjq0oVRc37w8+FMpktdK4TI=; b=JPfc0e+ihzOBDANjKfgcmR+uJy
	yFd3Ey2+M6bz/yrzSyCZsJoQQoJWxxFPrOda7Y+kKf+D/UmjPBw7W86R8wwEqlw0UBJR662GnMDmC
	ihBjU3eEy8RvqinXcZXLwoEMUdGfk/a8GMyJ5rQ23PHGm0nLIkPHB8Wm4Bfy0qbMu4bsia0PoJwx/
	NdjjrQ9GSfWncw8viDV7H1BpHFTnG4d19pRmZ8aqwwzPgRSeoiKorXuKR419qjuvpJlIXtZ6dJT/z
	shpD/cF441UdOwZYCP8p/1anhUaVbq+n4Ht93KLgjGmRPQrA9+QCPpKjiGvUqAD4sObqSTRwrlw9+
	0YtuKlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjtr-0000000Bgyh-0ocD;
	Fri, 13 Nov 2026 05:32:35 +0000
Received: from out28-1.mail.aliyun.com ([115.124.28.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjtn-0000000Bgxf-0NbK;
	Fri, 13 Nov 2026 05:32:33 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4780966|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0231934-0.00123713-0.975569;FP=7888793062833208487|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.k13i.MA_1794547943;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k13i.MA_1794547943 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:32:23 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] pinctrl: bcm: Two bounds fixes and a dt_free_map cleanup
Date: Fri, 13 Nov 2026 05:32:17 +0000
Message-Id: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213231_486106_E01A319D 
X-CRM114-Status: UNSURE (   9.39  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes two out-of-bounds accesses in the BCM pin controllers
and drops two hand-written dt_free_map callbacks that duplicate
pinctrl_utils_free_map().

1/4 indexes funcs[] with the raw FSEL field, which is 1-based: 0 means
GPIO, 1..n_funcs map to funcs[0..n_funcs - 1]. Every debugfs readback is
therefore shifted by one slot, and n_funcs indexes past the array. Index
with fsel - 1 and map 0 and out-of-range values back to GPIO.

2/4 and 3/4 replace the per-driver dt_free_map with
pinconf_generic_dt_free_map(). Both drivers already select
GENERIC_PINCONF, and brcmstb already uses the generic dt_node_to_map, so
this is a mechanical cleanup with no behaviour change.

4/4 adds the missing AON SGPIO entries. The controller describes six
SGPIO pins at pin 32..37, but the function tables stop at pin 16 (C0)
and pin 14 (D0), so dumping the pin list indexes past the end. The
function data comes from the downstream rpi-6.12.y driver; C0 and D0
differ on the HDMI1 and PMIC I2C signals.

Testing: 1/4 was run on a Raspberry Pi 5 with KASAN; the "alt8" readback
no longer splats and field 0 reports GPIO. 4/4's out-of-bounds read was
reproduced on the same board. Its D0 entries are not runtime tested,
because the board loads the C0 table.

Changes in v2:
- 1/4: the commit message describes the bug in prose instead of pasting
  the fix, as Andrea suggested.
- 4/4 is new, for the SGPIO out-of-bounds read he reported.

Link to v1:
- https://patchwork.kernel.org/project/linux-arm-kernel/cover/20261106070628.1428691-1-wangxiaolei01@kaihong.com/


Xiaolei Wang (4):
  pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
  pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
  pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb
  pinctrl: bcm: Add missing SGPIO entries to the BCM2712 AON tables

 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 16 ++----------
 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 12 +++++++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 26 ++++++++-----------
 3 files changed, 25 insertions(+), 29 deletions(-)

-- 
2.34.1


