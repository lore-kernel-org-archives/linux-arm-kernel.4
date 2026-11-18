Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5960A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iR1SCU/9;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZUGoGX5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CyjKDjy9c46o/HWa56BDlf4pykp2gQLkYqhUcMj3WmQ=; b=iR1SCU/9KO1E6cae3g2KCpMFxe
	9XFqZczt4ZnNavEGepzCX8hM9lO5Mose1wKnsTUMkWHYUa50b0F93NQGkz4bUWLzOP+WGC/V3VbZY
	8aZ6rThcnYHNVWQRHD4EQircjtFIa6YMKxm9PPJu3nV+REDone8zFoWb1KwSudf+W/2CCq8YoMBja
	IvAcUXu8qeioqCpogp4OWhZJtPvyQuvfGFWJJaX+mlO3vjeHX4w1E1DCAdXtOiM82+RUXC6tynf2U
	LpzwsBHLkqUA7D4+YktBS9HLGP+XdJLGfWIh5de5OMS/cTrGOd76j4mdNpjpEEuvuMnkEbCjmAw7W
	NOW9uq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirk-00000009Zun-0HZJ;
	Wed, 18 Nov 2026 16:50:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirG-00000009ZhZ-3llg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 894EE1A16D4;
	Wed, 18 Nov 2026 16:50:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51DA25FE9B;
	Wed, 18 Nov 2026 16:50:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B73EC11BC288E;
	Wed, 18 Nov 2026 17:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CyjKDjy9c46o/HWa56BDlf4pykp2gQLkYqhUcMj3WmQ=;
	b=ZUGoGX5bBxznGuj2njy1KOPSgGFIOjUlp8TNOOXoCntty8WmdVCpyfs4sYguwawSwOav8a
	4LJNI6/NlRMXiURLOqu0IQyqoA1O7731csdWZ6ExGtQf1E3k1/goi1gS7mPkYSS2NANZBk
	6N4vxmmbuB49N2WFZ3B51Vr3/daAxw2TpKsb35IUPX2isGt/Fdf9+vM5xGusg5GT4/NlKl
	7+2yvEVbnS2qrUUp2XQ6aP0OaKlGdpb03kcO/pZYjtanjTUlNHOstypjXlB3ddOU42NEIi
	UYcZGVrIcfn7XLhtMmUjOT+rdprQolwtMzqoOmq49JiZbJ66OqbwN2kL4cGqGg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH RFC v3 00/31] drm bridge hotplug
Date: Wed, 18 Nov 2026 17:49:43 +0100
Message-Id: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OywrCMBBFf6VkbSSPJrSuBMEPcCsuTDO1EW00S
 YNS+u+mDwTB5Z25c870yIMz4NEm65GDaLyxbQp8laGqObcXwEanjBhhkggqsHZ3rJzRadPY8Lh
 1F5xLJoXmZ1YXAqXDh4PavCboER32O3Sah75TV6jCiFtqDp5dUoa5O9Ya44N17+mfSCfCoi7/q
 SPFBOcCmNKK61rlW2VtuJl2Xdn75I3sC6GE0L8QliAF8LwspK6ULH4hwzB8AGftJr8nAQAA
X-Change-ID: 20260515-drm-bridge-hotplug-46265d3a2f85
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085007_303551_50F9C903 
X-CRM114-Status: GOOD (  21.61  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

this series adds support for devices with a DRM pipeline whose final
components, including one or more bridges, can be hot-plugged and
hot-unplugged.

For more about the use case see the v1 cover letter:
https://lore.kernel.org/lkml/20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com/

Design
======

The drm_bridge_connector is nowadays the recommended way to implement DRM
connectors when a chain of bridges is used.

This series proposes a small helper (drm_hotplug_helper) which drivers can
use to make their encoder able to:

 * receive hotplug-relevant events
 * add a drm_bridge_connector when a new bridge is added making the
   pipeline complete in the hardware
 * remove the drm_bridge_connector when a bridge is removed
 * start/stop HPD polling when the connector is added/removed
   (despite the name, HPD is pretty much orthogonal to bridge hotplug)
 
Series layout
=============

There are various preparation steps before the last patches introduce
bridge hotplug itself.

 A. Add a dynamic variant of drmm_connector_hdmi_init() and non-drmm
    hdmi-cec API
    (needed for the bridge-connector to allocate the connector dynamically)

     1	drm/display: hdmi-cec-helper: use drmm_ prefix for drmm action
     2	drm/display: hdmi-cec-helper: add non-drmm API variant
     3	drm/display: hdmi-cec-notifier-helper: use drmm_ prefix for drmm action
     4	drm/display: hdmi-cec-notifier-helper: add non-drmm API variant
     5	drm/connector: split drmm_connector_hdmi_init() in 3 parts
     6	drm/connector: add drm_connector_hdmi_dynamic_init()

 B. bridge-connector: use a dynamic drm_connector

     7	drm/display: bridge-connector: split allocation code from initialization code
     8	drm/display: bridge-connector: hoist error management to common code
     9	drm/display: bridge-connector: use a dynamic connector
    10	drm/display: bridge-connector: add APIs to add/remove the connector dynamically

 C. Misc preparation work

    11	drm/bridge: constify of_drm_find_and_get_bridge() device_node parameter
    12	drm/bridge: initialize chain_node list head on allocation
    13	drm/bridge: initialize chain_node list head on detach and attach errors
    14	drm/bridge: ti-sn65dsi86: protect device resources on unplug
    15	drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from list

 D. Add notifier mechanism to let common code (the bridge-connector)
    take actions on hotplug events

    16	drm: event-notifier: add mechanism to notify about hotplug events
    17	drm/bridge: notify about added and detached bridges
    18	drm/mipi-dsi: notify about DSI attach

 E. Let bridges return their next bridge
    (allows to know when the pipeline is complete)

    19	drm/bridge: add drm_bridge_get_next() and supporting func
    20	drm/panel: implement .get_next_bridge
    21	drm/bridge: display-connector: implement .get_next_bridge
    22	drm/bridge: ti-sn65dsi83: implement .get_next_bridge
    23	drm/bridge: ti-sn65dsi86: implement .get_next_bridge
    24	drm/bridge: samsung-dsim: implement .get_next_bridge

 F. drm_bridge: stop pipeline when a bridge is removed

    25	drm/bridge: add drm_bridge_detach_from()
    26	drm/atomic: add drm_atomic_shutdown_encoder()
    27	drm/tests: atomic: add tests for drm_atomic_shutdown_encoder()
    28	drm/bridge: clear bridge->encoder on detach
    29	drm/bridge: shutdown encoder and detach downstream bridges on bridge unplug

 G. Implement bridge hotplug in bridge-connector, enable it in a driver

    30	drm: drm_hotplug_helper: new helper to implement bridge hotplug
    31	drm/mxsfb/lcdif: enable bridge hotplug

== Grand plan

This is part of the work to support hotplug of DRM bridges.

Here's the work breakdown (➜ marks the current series):

1. … add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ✔ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ✔ bridge-only drm_of_find_panel_or_bridge() users (v7.2)
       8. … panel_bridge lifetime
          a. ✔ cleanup DRM_PANEL in bridge drivers (v7.4)
	  b. ✔ embed a drm_bridge in every drm_panel (v7.4)
	  c. ✔ remove *_of_get_bridge(): non-OF drivers (v7.5)
	  d. … remove drmm_of_get_bridge()
	  e. … remove devm_drm_of_get_bridge(), part 1
	  f.   remove devm_drm_of_get_bridge(), part 2
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ✔ handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. ✕ DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. ➜ DRM bridge hotplug
    A. ➜ Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
       2. ➜ drm bridge hotplug
    B.   Device tree description
   

---
Changes in v3:
- Handle use cases where the first bridge after the encoder is hotpluggable
  (in v1 and v2 the first bridge was required to be always present)
  as well as all cases where the first bridge is a DSI host
   - Removed "samsung-dsim: move drm_bridge_add() call to probe", not
     needed anymore
- Handle hot-pluggable bridges supporting HPD, add TI SN65DSI86 DSI-to-DP
- Fully implement dynamic connector in drm_bridge_connector (CEC helpers
  were missing in v2)
- Fixed shutdown to not shutdown the whole card
   - as a consequence, removed (not needed anymore)
     "drm/atomic: move [...] from drm_atomic_helper to drm_atomic"
- Many smaller fixes and improvements
- Link to v2: https://patch.msgid.link/20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com

Changes in v2:
- Rewrote: added new drm_hotplug_helper, dropped most changes to
  drm_bridge_connector
- Added get_next_bridge func, dropped is_tail func, and stop
  using -EPROBE_DEFER to mean a next bridge is needed but currently absent
- Rebased on drm-misc-next, which required a few reworks
- Fix dynconn mutex locking
- Fix sashiko-reported bugs
- Drop "drm/display: bridge-connector: store the drm_device pointer", not
  strongly needed, and adapt the remaining patches
- Simplify handle_hpd code types
- Lots of other smaller improvements
- Link to v1: https://patch.msgid.link/20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com

---
Luca Ceresoli (31):
      drm/display: hdmi-cec-helper: use drmm_ prefix for drmm action
      drm/display: hdmi-cec-helper: add non-drmm API variant
      drm/display: hdmi-cec-notifier-helper: use drmm_ prefix for drmm action
      drm/display: hdmi-cec-notifier-helper: add non-drmm API variant
      drm/connector: split drmm_connector_hdmi_init() in 3 parts
      drm/connector: add drm_connector_hdmi_dynamic_init()
      drm/display: bridge-connector: split allocation code from initialization code
      drm/display: bridge-connector: hoist error management to common code
      drm/display: bridge-connector: use a dynamic connector
      drm/display: bridge-connector: add APIs to add/remove the connector dynamically
      drm/bridge: constify of_drm_find_and_get_bridge() device_node parameter
      drm/bridge: initialize chain_node list head on allocation
      drm/bridge: initialize chain_node list head on detach and attach errors
      drm/bridge: ti-sn65dsi86: protect device resources on unplug
      drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from list
      drm: event-notifier: add mechanism to notify about hotplug events
      drm/bridge: notify about added and detached bridges
      drm/mipi-dsi: notify about DSI attach
      drm/bridge: add drm_bridge_get_next() and supporting func
      drm/panel: implement .get_next_bridge
      drm/bridge: display-connector: implement .get_next_bridge
      drm/bridge: ti-sn65dsi83: implement .get_next_bridge
      drm/bridge: ti-sn65dsi86: implement .get_next_bridge
      drm/bridge: samsung-dsim: implement .get_next_bridge
      drm/bridge: add drm_bridge_detach_from()
      drm/atomic: add drm_atomic_shutdown_encoder()
      drm/tests: atomic: add tests for drm_atomic_shutdown_encoder()
      drm/bridge: clear bridge->encoder on detach
      drm/bridge: shutdown encoder and detach downstream bridges on bridge unplug
      drm: drm_hotplug_helper: new helper to implement bridge hotplug
      drm/mxsfb/lcdif: enable bridge hotplug

 MAINTAINERS                                        |  16 +
 drivers/gpu/drm/Kconfig                            |   5 +
 drivers/gpu/drm/Makefile                           |   2 +
 drivers/gpu/drm/bridge/display-connector.c         |   7 +
 drivers/gpu/drm/bridge/samsung-dsim.c              |   9 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   9 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  61 +++-
 drivers/gpu/drm/display/Kconfig                    |   7 +
 drivers/gpu/drm/display/Makefile                   |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 225 ++++++++++----
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      |  62 ++--
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  34 ++-
 drivers/gpu/drm/display/drm_hotplug_helper.c       | 325 +++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                       | 151 ++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  87 +++++-
 drivers/gpu/drm/drm_connector.c                    | 131 ++++++---
 drivers/gpu/drm/drm_hotplug_event_notifier.c       |  62 ++++
 drivers/gpu/drm/drm_mipi_dsi.c                     |   3 +
 drivers/gpu/drm/drm_panel.c                        |   8 +-
 drivers/gpu/drm/mxsfb/Kconfig                      |   2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |  40 ++-
 drivers/gpu/drm/tests/drm_bridge_test.c            | 209 +++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h          |  21 ++
 include/drm/drm_atomic.h                           |   1 +
 include/drm/drm_bridge.h                           |  27 +-
 include/drm/drm_bridge_connector.h                 |   4 +
 include/drm/drm_connector.h                        |   6 +
 include/drm/drm_hotplug_event_notifier.h           |  52 ++++
 include/drm/drm_hotplug_helper.h                   |  30 ++
 29 files changed, 1442 insertions(+), 156 deletions(-)
---
base-commit: 9c327dceb627a7947de3e82da6363fa508fd619b
change-id: 20260515-drm-bridge-hotplug-46265d3a2f85

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


